@implementation ICAttachment(PDFGalleryVersion)

- (uint64_t)docCamPDFVersion
{
  void *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__ICAttachment_PDFGalleryVersion__docCamPDFVersion__block_invoke;
  v5[3] = &unk_1E5C1D9D0;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(v2, "performBlockAndWait:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
