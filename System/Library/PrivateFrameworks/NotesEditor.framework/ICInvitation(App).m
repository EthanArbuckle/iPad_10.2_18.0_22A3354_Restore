@implementation ICInvitation(App)

- (id)highlight
{
  void *v2;
  void *v3;
  void *v4;

  +[ICSharedWithYouController sharedController](ICSharedWithYouController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shareURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
