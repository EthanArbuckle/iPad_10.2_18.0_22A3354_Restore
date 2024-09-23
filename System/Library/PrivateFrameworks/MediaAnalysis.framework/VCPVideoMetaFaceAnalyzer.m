@implementation VCPVideoMetaFaceAnalyzer

- (VCPVideoMetaFaceAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  VCPVideoMetaFaceAnalyzer *v4;
  VCPVideoMetaFaceAnalyzer *v5;
  NSMutableDictionary *activeFaces;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  NSMutableArray *faceResults;
  VCPVideoMetaFaceAnalyzer *v11;
  _OWORD v13[6];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VCPVideoMetaFaceAnalyzer;
  v4 = -[VCPVideoMetaFaceAnalyzer init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    activeFaces = v4->_activeFaces;
    v4->_activeFaces = 0;

    v7 = *(_OWORD *)&a3->c;
    v13[0] = *(_OWORD *)&a3->a;
    v13[1] = v7;
    v13[2] = *(_OWORD *)&a3->tx;
    -[VCPVideoMetaFaceAnalyzer flipTransform:](v5, "flipTransform:", v13);
    v9 = v13[4];
    v8 = v13[5];
    *(_OWORD *)&v5->_transform.a = v13[3];
    *(_OWORD *)&v5->_transform.c = v9;
    *(_OWORD *)&v5->_transform.tx = v8;
    faceResults = v5->_faceResults;
    v5->_faceResults = 0;

    v11 = v5;
  }

  return v5;
}

- (CGAffineTransform)flipTransform:(SEL)a3
{
  __int128 v4;
  CGAffineTransform v6;
  CGAffineTransform t1;

  if (a4->tx != 0.0)
    a4->tx = 1.0;
  if (a4->ty != 0.0)
    a4->ty = 1.0;
  v6.b = 0.0;
  v6.c = 0.0;
  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v6.a = 1.0;
  *(_OWORD *)&v6.d = xmmword_1B6FBCA30;
  v6.ty = 1.0;
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  NSMutableDictionary *activeFaces;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  VCPFaceDetectionRange *v19;
  NSMutableDictionary *v20;
  void *v21;
  int v22;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  CMTime v28;
  CMTime v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  CMTime v34;
  CMTime v35[2];
  CMTime v36;
  CGAffineTransform v37;
  CGRect v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CMTime rhs;
  CMTime lhs;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = v6;
  if (v6)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v6, "items", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v8)
    {
      obj = v7;
      v26 = *(_QWORD *)v40;
      while (2)
      {
        v27 = v8;
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v38, 0, sizeof(v38));
          objc_msgSend(v11, "bounds");
          v12 = *(_OWORD *)&self->_transform.c;
          *(_OWORD *)&v37.a = *(_OWORD *)&self->_transform.a;
          *(_OWORD *)&v37.c = v12;
          *(_OWORD *)&v37.tx = *(_OWORD *)&self->_transform.tx;
          v38 = CGRectApplyAffineTransform(v47, &v37);
          v13 = MediaAnalysisFacePosition(&v38);
          *a4 |= 0x20uLL;
          activeFaces = self->_activeFaces;
          if (!activeFaces)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
            v16 = self->_activeFaces;
            self->_activeFaces = v15;

            activeFaces = self->_activeFaces;
            if (!activeFaces)
            {

              v22 = -108;
              goto LABEL_26;
            }
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "faceID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](activeFaces, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            if (v10)
            {
              objc_msgSend(v10, "time");
              objc_msgSend(v10, "duration");
            }
            else
            {
              memset(v35, 0, sizeof(v35));
            }
            lhs = v35[1];
            rhs = v35[0];
            CMTimeAdd(&v36, &lhs, &rhs);
            v34 = v36;
            objc_msgSend(v18, "setLast:", &v34);
            objc_msgSend(v18, "setPosition:", objc_msgSend(v18, "position") | v13);
          }
          else
          {
            v19 = objc_alloc_init(VCPFaceDetectionRange);
            if (v10)
            {
              objc_msgSend(v10, "time");
            }
            else
            {
              v32 = 0uLL;
              v33 = 0;
            }
            v30 = v32;
            v31 = v33;
            -[VCPFaceDetectionRange setStart:](v19, "setStart:", &v30);
            if (v10)
            {
              objc_msgSend(v10, "time");
              objc_msgSend(v10, "duration");
            }
            else
            {
              memset(v35, 0, sizeof(v35));
            }
            lhs = v35[1];
            rhs = v35[0];
            CMTimeAdd(&v29, &lhs, &rhs);
            v28 = v29;
            -[VCPFaceDetectionRange setLast:](v19, "setLast:", &v28);
            -[VCPFaceDetectionRange setBounds:](v19, "setBounds:", *(_OWORD *)&v38.origin, *(_OWORD *)&v38.size);
            -[VCPFaceDetectionRange setPosition:](v19, "setPosition:", v13);
            v20 = self->_activeFaces;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "faceID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v19, v21);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v8)
          continue;
        break;
      }
      v22 = 0;
LABEL_26:
      v7 = obj;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = -50;
  }

  return v22;
}

- (int)finalizeAnalysis
{
  NSMutableArray *v3;
  NSMutableArray *faceResults;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *obj;
  uint64_t v18;
  uint64_t v19;
  CMTime v20[2];
  CMTime v21;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMTime rhs;
  CMTime time;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[4];
  _BYTE v33[128];
  uint64_t v34;
  NSRect v35;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_faceResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    faceResults = self->_faceResults;
    self->_faceResults = v3;

    if (!self->_faceResults)
      return -108;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_activeFaces;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v5)
    {
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = v5;
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(obj);
          -[NSMutableDictionary objectForKey:](self->_activeFaces, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          v9 = self->_faceResults;
          v31[0] = CFSTR("start");
          if (v7)
            objc_msgSend(v7, "start");
          else
            memset(&v22, 0, sizeof(v22));
          time = v22;
          v10 = CMTimeCopyAsDictionary(&time, 0);
          v32[0] = v10;
          v31[1] = CFSTR("duration");
          if (v8)
          {
            objc_msgSend(v8, "last");
            objc_msgSend(v8, "start");
          }
          else
          {
            memset(v20, 0, sizeof(v20));
          }
          time = v20[1];
          rhs = v20[0];
          CMTimeSubtract(&v21, &time, &rhs);
          time = v21;
          v11 = CMTimeCopyAsDictionary(&time, 0);
          v32[1] = v11;
          v32[2] = &unk_1E6B726B0;
          v31[2] = CFSTR("flags");
          v31[3] = CFSTR("attributes");
          v29[0] = CFSTR("facePosition");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "position"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v29[1] = CFSTR("faceBounds");
          v30[0] = v12;
          objc_msgSend(v8, "bounds");
          NSStringFromRect(v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v30[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v32[3] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v9, "addObject:", v15);

        }
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v5);
    }

  }
  return 0;
}

- (id)publicResults
{
  void *v3;
  NSMutableArray *faceResults;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray count](self->_faceResults, "count");
  if (v3)
  {
    faceResults = self->_faceResults;
    v6 = CFSTR("FaceResults");
    v7[0] = faceResults;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_activeFaces, 0);
}

@end
