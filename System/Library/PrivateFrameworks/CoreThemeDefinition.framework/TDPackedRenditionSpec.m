@implementation TDPackedRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t j;
  void *v41;
  id v42;
  void *v43;
  void *v45;
  _BOOL4 v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v6 = a3;
  v59 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend((id)-[TDPackedRenditionSpec packedRenditions](self, "packedRenditions", a3, a4), "allObjects");
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __86__TDPackedRenditionSpec_createCSIRepresentationWithCompression_colorSpaceID_document___block_invoke;
  v56[3] = &unk_24EF2C688;
  v47 = a5;
  v56[4] = a5;
  v9 = (void *)objc_msgSend(v8, "sortedArrayUsingComparator:", v56);
  if (!objc_msgSend(v9, "count"))
    return 0;
  v46 = v6;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 |= objc_msgSend(v18, "allowsPaletteImageCompression");
          v13 |= objc_msgSend(v18, "allowsHevcCompression");
          v14 |= objc_msgSend(v18, "allowsDeepmapCompression");
          v15 |= objc_msgSend(v18, "allowsDeepmap2Compression");
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v11);
  }
  else
  {
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    LOBYTE(v14) = 0;
    LOBYTE(v15) = 0;
  }
  v20 = objc_msgSend(v47, "allowsExtendedRangePixelFormats");
  v21 = -[TDPackedRenditionSpec monochrome](self, "monochrome");
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithCanvasSize:sliceCount:layout:", 0, 1004, (double)(int)-[TDPackedRenditionSpec width](self, "width"), (double)(int)-[TDPackedRenditionSpec height](self, "height"));
  objc_msgSend(v22, "setTargetPlatform:", objc_msgSend(v47, "targetPlatform"));
  v23 = objc_msgSend((id)objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier");
  if (v21)
    v24 = 2;
  else
    v24 = 1;
  if (v21)
    v25 = 1195456544;
  else
    v25 = 1095911234;
  if (v20)
    v26 = 4;
  else
    v26 = 3;
  if (v20)
    v27 = 6;
  else
    v27 = 2;
  if (v21)
    v28 = 1195454774;
  else
    v28 = 1380401751;
  if (v21)
    v26 = v27;
  if (v23 == 1)
    v29 = v28;
  else
    v29 = v25;
  if (v23 == 1)
    v30 = v26;
  else
    v30 = v24;
  objc_msgSend(v22, "setPixelFormat:", v29);
  v31 = -[TDPackedRenditionSpec alphaCrop](self, "alphaCrop");
  objc_msgSend(v22, "setName:", -[TDPackedRenditionSpec renditionPackName](self, "renditionPackName"));
  if (objc_msgSend((id)-[TDPackedRenditionSpec compressionType](self, "compressionType"), "identifier"))
    objc_msgSend(v22, "setCompressionType:", objc_msgSend((id)-[TDPackedRenditionSpec compressionType](self, "compressionType"), "identifier"));
  objc_msgSend(v22, "setAllowsMultiPassEncoding:", 1);
  objc_msgSend(v22, "setAllowsPaletteImageCompression:", v12 & 1);
  objc_msgSend(v22, "setAllowsHevcCompression:", v13 & 1);
  objc_msgSend(v22, "setAllowsDeepmapImageCompression:", v14 & 1);
  objc_msgSend(v22, "setAllowsDeepmap2ImageCompression:", v15 & 1);
  objc_msgSend(v22, "setColorSpaceID:", v30);
  objc_msgSend(v22, "setScaleFactor:", objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
  objc_msgSend(v22, "addSliceRect:", *MEMORY[0x24BDD1408], *(double *)(MEMORY[0x24BDD1408] + 8), *(double *)(MEMORY[0x24BDD1408] + 16), *(double *)(MEMORY[0x24BDD1408] + 24));
  objc_msgSend(v22, "setBlendMode:", 0);
  objc_msgSend(v22, "setOpacity:", 1.0);
  objc_msgSend(v22, "setPreserveForArchiveOnly:", -[TDPackedRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C18]), "initWithPixelWidth:pixelHeight:", -[TDPackedRenditionSpec width](self, "width"), -[TDPackedRenditionSpec height](self, "height"));
  objc_msgSend(v32, "setTargetPlatform:", objc_msgSend(v47, "targetPlatform"));
  objc_msgSend(v32, "setAllowsMultiPassEncoding:", 1);
  objc_msgSend(v32, "setPixelFormat:", objc_msgSend(v22, "pixelFormat"));
  objc_msgSend(v32, "setColorSpaceID:", (int)objc_msgSend(v22, "colorSpaceID"));
  if (-[TDPackedRenditionSpec opaque](self, "opaque"))
    v33 = 6;
  else
    v33 = 2;
  objc_msgSend(v32, "setSourceAlphaInfo:", v33);
  v34 = v22;
  objc_msgSend(v22, "addBitmap:", v32);
  v45 = v32;
  v35 = objc_msgSend(v32, "bitmapContext");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v49;
    do
    {
      v39 = v9;
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(v39);
        v41 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        if (v31)
        {
          v42 = objc_alloc_init(MEMORY[0x24BE28C70]);
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend(v41, "keySpec"), "key"));
          objc_msgSend(v42, "setReferenceKey:", v43);
          objc_msgSend(v34, "addLayerReference:", v42);

        }
        objc_msgSend(v41, "drawPackableRenditionInContext:withDocument:", v35, v47);
      }
      v9 = v39;
      v37 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v37);
  }
  v19 = (void *)objc_msgSend(v34, "CSIRepresentationWithCompression:", v46);

  return v19;
}

uint64_t __86__TDPackedRenditionSpec_createCSIRepresentationWithCompression_colorSpaceID_document___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "keySpec"), "key");
  objc_msgSend((id)objc_msgSend(a3, "keySpec"), "key");
  objc_msgSend(*(id *)(a1 + 32), "untrimmedRenditionKeyFormat");
  return CUICompareRenditionKey();
}

- (id)renditionPackName
{
  int v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  const __CFString *v9;

  v3 = -[TDPackedRenditionSpec alphaCrop](self, "alphaCrop");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "scaleFactor");
  v6 = -[TDPackedRenditionSpec opaque](self, "opaque");
  v7 = -[TDPackedRenditionSpec monochrome](self, "monochrome");
  v8 = objc_msgSend((id)objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier");
  if (v3)
    v9 = CFSTR("ZZZZExplicitlyPackedAsset-%d.%d.%d-gamut%d");
  else
    v9 = CFSTR("ZZZZPackedAsset-%d.%d.%d-gamut%d");
  return (id)objc_msgSend(v4, "stringWithFormat:", v9, v5, v6, v7, v8);
}

@end
