@implementation ExifMetadataExtractor

- (ExifMetadataExtractor)init
{
  ExifMetadataExtractor *v2;
  uint64_t v3;
  NSDictionary *desiredAppleMakerKeyPairs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *desiredExifKeysArray;
  objc_super v12;
  _QWORD v13[6];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)ExifMetadataExtractor;
  v2 = -[ExifMetadataExtractor init](&v12, sel_init);
  v14[0] = CFSTR("AEAverage");
  v14[1] = CFSTR("AESTable");
  v15[0] = CFSTR("6");
  v15[1] = CFSTR("4");
  v14[2] = CFSTR("AFStable");
  v15[2] = CFSTR("7");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  desiredAppleMakerKeyPairs = v2->desiredAppleMakerKeyPairs;
  v2->desiredAppleMakerKeyPairs = (NSDictionary *)v3;

  v5 = *MEMORY[0x1E0CBCB00];
  v13[0] = *MEMORY[0x1E0CBCBC8];
  v13[1] = v5;
  v6 = *MEMORY[0x1E0CBCB58];
  v13[2] = *MEMORY[0x1E0CBCB78];
  v13[3] = v6;
  v7 = *MEMORY[0x1E0CBCBE0];
  v13[4] = *MEMORY[0x1E0CBCB88];
  v13[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mutableCopy");
  desiredExifKeysArray = v2->desiredExifKeysArray;
  v2->desiredExifKeysArray = (NSMutableArray *)v9;

  return v2;
}

- (BOOL)keyIsDesired:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->desiredExifKeysArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)performCorrectionsOnDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = *MEMORY[0x1E0CBCB58];
  if (-[ExifMetadataExtractor keyIsDesired:](self, "keyIsDesired:", *MEMORY[0x1E0CBCB58]))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      LODWORD(v6) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v4);

  }
}

- (BOOL)CopyFromMakerMediaDict:(id)a3 toDict:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->desiredAppleMakerKeyPairs;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v17 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->desiredAppleMakerKeyPairs, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);
        else
          v17 = 0;

      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  else
  {
    v17 = 1;
  }

  return v17 & 1;
}

- (void)CopyFacesDataFromAuxDictionary:(id)a3 toArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Regions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RegionList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Type"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", CFSTR("Face")))
              objc_msgSend(v5, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }
    }

  }
}

- (BOOL)copyKeysFromDictionary:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *metadataDictionary;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->desiredExifKeysArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);
        else
          v10 = 0;

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  metadataDictionary = self->metadataDictionary;
  self->metadataDictionary = v5;

  return v10 & 1;
}

- (signed)processFile
{
  NSURL *inFileURL;
  CGImageSource *v4;
  CGImageSource *v5;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  NSMutableArray *v11;
  NSMutableArray *facesArray;
  void *v13;
  signed __int16 v14;

  self->hadAllRequestedKeys = 0;
  inFileURL = self->inFileURL;
  if (inFileURL)
  {
    v4 = CGImageSourceCreateWithURL((CFURLRef)inFileURL, 0);
    if (v4)
    {
      v5 = v4;
      v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
      if (self->saveAllMetadata)
        objc_storeStrong((id *)&self->allMetadata, v6);
      if (v6)
      {
        -[__CFDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0CBCB50]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          self->hadAllRequestedKeys = -[ExifMetadataExtractor copyKeysFromDictionary:](self, "copyKeysFromDictionary:", v7);
        -[__CFDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0CBCF70]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = -[ExifMetadataExtractor CopyFromMakerMediaDict:toDict:](self, "CopyFromMakerMediaDict:toDict:", v8, self->metadataDictionary);
          v10 = self->hadAllRequestedKeys && v9;
          self->hadAllRequestedKeys = v10;
        }
        v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        facesArray = self->facesArray;
        self->facesArray = v11;

        -[__CFDictionary objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0CBCA28]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[ExifMetadataExtractor CopyFacesDataFromAuxDictionary:toArray:](self, "CopyFacesDataFromAuxDictionary:toArray:", v13, self->facesArray);

        v14 = 0;
      }
      else
      {
        v14 = -5003;
      }
      CFRelease(v5);

    }
    else
    {
      v14 = -5002;
    }
  }
  else
  {
    v14 = -5001;
  }
  if (self->metadataDictionary)
    -[ExifMetadataExtractor performCorrectionsOnDictionary:](self, "performCorrectionsOnDictionary:");
  return v14;
}

- (NSURL)inFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)metadataDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)desiredExifKeysArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDesiredExifKeysArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)hadAllRequestedKeys
{
  return self->hadAllRequestedKeys;
}

- (NSMutableArray)facesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)saveAllMetadata
{
  return self->saveAllMetadata;
}

- (void)setSaveAllMetadata:(BOOL)a3
{
  self->saveAllMetadata = a3;
}

- (NSDictionary)allMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->allMetadata, 0);
  objc_storeStrong((id *)&self->facesArray, 0);
  objc_storeStrong((id *)&self->desiredExifKeysArray, 0);
  objc_storeStrong((id *)&self->metadataDictionary, 0);
  objc_storeStrong((id *)&self->inFileURL, 0);
  objc_storeStrong((id *)&self->desiredAppleMakerKeyPairs, 0);
}

@end
