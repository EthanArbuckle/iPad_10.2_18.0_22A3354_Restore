@implementation PDCRemoteRenderedContentPreviewController

- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  height = a3.height;
  width = a3.width;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCRemoteRenderedContentPreviewController renderedContentURLs](self, "renderedContentURLs", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
      if (objc_msgSend(v15, "isFileURL")
        && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path")),
            v17 = (void *)PLCreateImageFromFileWithFormat(v16, 0, 0, 4007, 0, 0, 0),
            v16,
            v17)
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(+[PLVideoTranscoder generatePosterFrameForVideoAtURL:maxSize:error:](PLVideoTranscoder, "generatePosterFrameForVideoAtURL:maxSize:error:", v15, 0, width, height))) != 0)
      {
        objc_msgSend(v9, "addObject:", v17);

      }
      if ((unint64_t)objc_msgSend(v9, "count") >= a5)
        break;
      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  return v9;
}

- (NSArray)renderedContentURLs
{
  return self->_renderedContentURLs;
}

- (void)setRenderedContentURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedContentURLs, 0);
}

@end
