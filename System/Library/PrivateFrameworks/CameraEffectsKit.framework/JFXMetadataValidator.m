@implementation JFXMetadataValidator

- (JFXMetadataValidator)init
{
  JFXMetadataValidator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXMetadataValidator;
  result = -[JFXMetadataValidator init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_faceDataDetectedFacesCount = xmmword_226AB78C0;
    result->_lastARFrameIsFaceTracked = 2;
  }
  return result;
}

- (void)validateARImageData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    JFXLog_metadata();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[JFXMetadataValidator validateARImageData:].cold.2(v5);

  }
  objc_msgSend(v4, "faceData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    JFXLog_metadata();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[JFXMetadataValidator validateARImageData:].cold.1(v10);
    goto LABEL_11;
  }
  objc_msgSend(v4, "faceData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detectedFaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (-[JFXMetadataValidator faceDataDetectedFacesCount](self, "faceDataDetectedFacesCount") != v9)
  {
    -[JFXMetadataValidator setFaceDataDetectedFacesCount:](self, "setFaceDataDetectedFacesCount:", v9);
    JFXLog_metadata();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = v9;
      _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, "The number of detected faces has changed: %lu", (uint8_t *)&v11, 0xCu);
    }
LABEL_11:

  }
}

- (void)validateFaceTrackedARFrame:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "anchors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "isTracked"))
            v7 = 1;
          v8 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);

    if (v8)
      goto LABEL_20;
  }
  else
  {

    v7 = 0;
  }
  if (-[JFXMetadataValidator lastARFrameHasFaceAnchors](self, "lastARFrameHasFaceAnchors"))
  {
    JFXLog_metadata();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "frames no longer contain face anchors", v15, 2u);
    }
    v8 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v8 = 0;
LABEL_20:
  if (v8 != -[JFXMetadataValidator lastARFrameHasFaceAnchors](self, "lastARFrameHasFaceAnchors"))
  {
    JFXLog_metadata();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "frames now contain face anchors", v15, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:
  -[JFXMetadataValidator setLastARFrameHasFaceAnchors:](self, "setLastARFrameHasFaceAnchors:", v8);
  if (!v7 && -[JFXMetadataValidator lastARFrameIsFaceTracked](self, "lastARFrameIsFaceTracked"))
  {
    JFXLog_metadata();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v14 = "frames are no longer face-tracked";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v7 != -[JFXMetadataValidator lastARFrameIsFaceTracked](self, "lastARFrameIsFaceTracked"))
  {
    JFXLog_metadata();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v14 = "frames are now face-tracked";
LABEL_31:
      _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_32:

  }
  -[JFXMetadataValidator setLastARFrameIsFaceTracked:](self, "setLastARFrameIsFaceTracked:", v7, *(_QWORD *)v15);
}

- (void)reset
{
  -[JFXMetadataValidator setFaceDataDetectedFacesCount:](self, "setFaceDataDetectedFacesCount:", 0x7FFFFFFFFFFFFFFFLL);
  -[JFXMetadataValidator setLastARFrameHasFaceAnchors:](self, "setLastARFrameHasFaceAnchors:", 2);
  -[JFXMetadataValidator setLastARFrameIsFaceTracked:](self, "setLastARFrameIsFaceTracked:", 2);
}

- (int64_t)faceDataDetectedFacesCount
{
  return self->_faceDataDetectedFacesCount;
}

- (void)setFaceDataDetectedFacesCount:(int64_t)a3
{
  self->_faceDataDetectedFacesCount = a3;
}

- (unint64_t)lastARFrameHasFaceAnchors
{
  return self->_lastARFrameHasFaceAnchors;
}

- (void)setLastARFrameHasFaceAnchors:(unint64_t)a3
{
  self->_lastARFrameHasFaceAnchors = a3;
}

- (unint64_t)lastARFrameIsFaceTracked
{
  return self->_lastARFrameIsFaceTracked;
}

- (void)setLastARFrameIsFaceTracked:(unint64_t)a3
{
  self->_lastARFrameIsFaceTracked = a3;
}

- (void)validateARImageData:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = CFSTR("ARImageData contains nil face data");
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v1, 0xCu);
}

- (void)validateARImageData:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "ARImageData is nil.", v1, 2u);
}

@end
