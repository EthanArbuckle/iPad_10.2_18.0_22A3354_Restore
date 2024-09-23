@implementation VNANFDMultiDetectorANFDv2

- (id)splitDetectedClassResultsIntoSubclasses:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = -[VNANFDMultiDetector isDetectedObject:ofAGivenObjectSubClass:](self, "isDetectedObject:ofAGivenObjectSubClass:", v11, CFSTR("Dog"));
          v13 = v5;
          if (!v12)
          {
            v14 = -[VNANFDMultiDetector isDetectedObject:ofAGivenObjectSubClass:](self, "isDetectedObject:ofAGivenObjectSubClass:", v11, CFSTR("Cat"));
            v13 = v6;
            if (!v14)
            {
              v18.receiver = self;
              v18.super_class = (Class)VNANFDMultiDetectorANFDv2;
              -[VNANFDMultiDetector splitDetectedClassResultsIntoSubclasses:](&v18, sel_splitDetectedClassResultsIntoSubclasses_, v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v4 = v17;
              goto LABEL_14;
            }
          }
          objc_msgSend(v13, "addObject:", v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v8)
          continue;
        break;
      }
    }

    v4 = v17;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, v6, 0);
LABEL_14:

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VNANFDMultiDetectorANFDv2;
    -[VNANFDMultiDetector splitDetectedClassResultsIntoSubclasses:](&v23, sel_splitDetectedClassResultsIntoSubclasses_, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

@end
