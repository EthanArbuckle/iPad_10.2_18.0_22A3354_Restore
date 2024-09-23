@implementation TDTextStyleRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  void *v14;
  void *v15;

  v6 = objc_msgSend((id)objc_msgSend((id)-[TDTextStyleRenditionSpec production](self, "production", a3, a4, a5), "name"), "name");
  v7 = objc_alloc(MEMORY[0x24BE28C20]);
  v8 = -[TDTextStyleRenditionSpec fontName](self, "fontName");
  -[TDTextStyleRenditionSpec fontSize](self, "fontSize");
  v10 = v9;
  -[TDTextStyleRenditionSpec maxPointSize](self, "maxPointSize");
  v12 = v11;
  -[TDTextStyleRenditionSpec minPointSize](self, "minPointSize");
  v14 = (void *)objc_msgSend(v7, "initWithTextStyleNamed:fontName:fontSize:maxPointSize:minPointSize:scalingStyle:alignment:", v6, v8, -[TDTextStyleRenditionSpec scalingStyle](self, "scalingStyle"), -[TDTextStyleRenditionSpec alignment](self, "alignment"), v10, v12, v13);
  objc_msgSend(v14, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  objc_msgSend(v14, "setPreserveForArchiveOnly:", -[TDTextStyleRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v15 = (void *)objc_msgSend(v14, "CSIRepresentationWithCompression:", 0);

  return v15;
}

@end
