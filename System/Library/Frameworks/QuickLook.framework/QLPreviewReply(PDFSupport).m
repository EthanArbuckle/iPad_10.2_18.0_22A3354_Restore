@implementation QLPreviewReply(PDFSupport)

- (id)updateFromDocumentCreationBlock
{
  id v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  id v7;

  objc_msgSend(a1, "documentCreationBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "documentCreationBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = 0;
    ((void (**)(_QWORD, void *, id *))v3)[2](v3, a1, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v7;

    objc_msgSend(v4, "dataRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updateWithPDFData:", v5);

  }
  return v2;
}

@end
