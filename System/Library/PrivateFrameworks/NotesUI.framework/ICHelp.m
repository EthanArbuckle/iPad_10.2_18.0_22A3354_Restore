@implementation ICHelp

+ (NSURL)smartFoldersSupportURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212507"));
}

+ (NSURL)lockedNotesSupportURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/guide/security/secure-features-in-the-notes-app-sec1782bcab1"));
}

+ (void)presentWithTopic:(id)a3 presentingViewController:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "+[ICHelp presentWithTopic:presentingViewController:]", 1, 0, CFSTR("Unexpected call from background thread"));
  objc_msgSend(MEMORY[0x1E0D2FC58], "helpViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowTopicViewOnLoad:", 1);
  objc_msgSend(v9, "setDisplayHelpTopicsOnly:", 1);
  objc_msgSend(v9, "setSelectedHelpTopicID:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);

}

@end
