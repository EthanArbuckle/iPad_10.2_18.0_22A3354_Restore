@implementation QLItem(PreviewController)

- (uint64_t)isEdited
{
  _BOOL4 v2;
  void *v3;

  if (objc_msgSend(a1, "originalContentWasUpdated"))
    v2 = objc_msgSend(a1, "editingMode") == 3;
  else
    v2 = 0;
  objc_msgSend(a1, "editedFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 || v2;
}

@end
