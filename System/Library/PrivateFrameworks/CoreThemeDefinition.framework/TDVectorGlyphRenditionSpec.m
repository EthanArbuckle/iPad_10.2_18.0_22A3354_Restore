@implementation TDVectorGlyphRenditionSpec

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("VectorGlyphRenditionSpec"));
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  void *v7;
  TDVectorGlyphReader *v8;
  id v9;
  uint64_t v10;
  TDVectorGlyphReader *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  _QWORD v29[3];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)-[TDVectorGlyphRenditionSpec asset](self, "asset", a3, a4);
  v27 = 0;
  v8 = +[TDVectorGlyphReader vectorGlyphReaderWithURL:platform:error:](TDVectorGlyphReader, "vectorGlyphReaderWithURL:platform:error:", objc_msgSend(v7, "fileURLWithDocument:", a5), objc_msgSend(a5, "targetPlatform"), 0);
  if (!-[TDVectorGlyphReader vectorGlyphWithWeight:size:error:](v8, "vectorGlyphWithWeight:size:error:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"), &v27))goto LABEL_12;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v10 = *MEMORY[0x24BE28288];
  v29[0] = *MEMORY[0x24BE28110];
  v29[1] = v10;
  v30[0] = MEMORY[0x24BDBD1C8];
  v30[1] = MEMORY[0x24BDBD1C8];
  v29[2] = CFSTR("kCGSVGOmitHeaders");
  v30[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  if (!CGSVGDocumentWriteToData())
  {

    CGSVGDocumentRelease();
LABEL_12:
    v21 = 0;
    v11 = v8;
    goto LABEL_13;
  }
  v11 = (TDVectorGlyphReader *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithRawData:pixelFormat:layout:", v9, 1398163232, 1017);
  -[TDVectorGlyphReader setTargetPlatform:](v11, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  -[TDVectorGlyphReader setIsVectorBased:](v11, "setIsVectorBased:", 1);
  -[TDVectorGlyphReader setName:](v11, "setName:", objc_msgSend(v7, "name"));
  -[TDVectorGlyphReader setScaleFactor:](v11, "setScaleFactor:", objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
  -[TDVectorGlyphReader setCompressionType:](v11, "setCompressionType:", 2);
  -[TDVectorGlyphReader setTemplateRenderingMode:](v11, "setTemplateRenderingMode:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "templateRenderingMode"), "identifier"));
  -[TDVectorGlyphReader setOptOutOfThinning:](v11, "setOptOutOfThinning:", objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "optOutOfThinning"));
  -[TDVectorGlyphReader setIsFlippable:](v11, "setIsFlippable:", objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "isFlippable"));
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = (void *)-[TDVectorGlyphRenditionSpec avaliablePointSizes](self, "avaliablePointSizes", 0);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17++), "pointSize"));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v15);
  }
  -[TDVectorGlyphReader defaultPointSize](v8, "defaultPointSize");
  -[TDVectorGlyphReader setStandardVectorSize:](v11, "setStandardVectorSize:", v18);
  -[TDVectorGlyphReader setVectorSizes:](v11, "setVectorSizes:", v12);

  -[TDVectorGlyphReader baselineForVectorGlyphWithWeight:size:](v8, "baselineForVectorGlyphWithWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
  *(float *)&v19 = v19;
  -[TDVectorGlyphReader setBaseline:](v11, "setBaseline:", v19);
  -[TDVectorGlyphReader capHeightForVectorGlyphWithWeight:size:](v8, "capHeightForVectorGlyphWithWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
  *(float *)&v20 = v20;
  -[TDVectorGlyphReader setCapHeight:](v11, "setCapHeight:", v20);
  -[TDVectorGlyphReader alignmentRectInsetsForVectorGlyphWithWeight:size:](v8, "alignmentRectInsetsForVectorGlyphWithWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
  -[TDVectorGlyphReader setAlignmentRectInsets:](v11, "setAlignmentRectInsets:");
  -[TDVectorGlyphReader templateVersion](v8, "templateVersion");
  -[TDVectorGlyphReader setTemplateVersion:](v11, "setTemplateVersion:");
  -[TDVectorGlyphReader setInterpolatable:](v11, "setInterpolatable:", -[TDVectorGlyphReader isInterpolatableForWeight:size:](v8, "isInterpolatableForWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier")));
  -[TDVectorGlyphReader setVectorGlyphRenderingMode:](v11, "setVectorGlyphRenderingMode:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "vectorGlyphRenderingMode"), "identifier"));
  -[TDVectorGlyphReader setVectorContainsMulticolorLayers:](v11, "setVectorContainsMulticolorLayers:", -[TDVectorGlyphReader containsMulticolorLayers](v8, "containsMulticolorLayers"));
  -[TDVectorGlyphReader setVectorContainsHierarchicalLayers:](v11, "setVectorContainsHierarchicalLayers:", -[TDVectorGlyphReader containsHierarchicalLayers](v8, "containsHierarchicalLayers"));
  v21 = (void *)-[TDVectorGlyphReader CSIRepresentationWithCompression:](v11, "CSIRepresentationWithCompression:", 0);
  CGSVGDocumentRelease();

LABEL_13:
  return v21;
}

@end
