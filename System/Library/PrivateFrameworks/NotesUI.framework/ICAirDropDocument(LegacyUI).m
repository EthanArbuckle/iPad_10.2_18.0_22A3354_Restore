@implementation ICAirDropDocument(LegacyUI)

+ (id)legacyNoteAirDropDocumentWithWebArchive:()LegacyUI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "legacyNoteAirDropDocumentWithData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "data", "+[ICAirDropDocument(LegacyUI) legacyNoteAirDropDocumentWithWebArchive:]", 1, 0, CFSTR("Failed to generate data from webArchive %@"), v5);
      v7 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "webArchive", "+[ICAirDropDocument(LegacyUI) legacyNoteAirDropDocumentWithWebArchive:]", 1, 0, CFSTR("webArchive is nil"));
    v7 = 0;
  }

  return v7;
}

- (id)webArchiveFromLegacyNoteDocument
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataFromLegacyNoteDocument");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9728]), "initWithData:", v1);
    if (!v2)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "webArchive", "-[ICAirDropDocument(LegacyUI) webArchiveFromLegacyNoteDocument]", 1, 0, CFSTR("Failed to create WebArchive from data with length %lu"), objc_msgSend(v1, "length"));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
