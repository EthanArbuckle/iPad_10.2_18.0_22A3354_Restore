@implementation MailPresenter

- (BOOL)canComposeMail
{
  return objc_msgSend((id)objc_opt_self(), sel_canSendMail);
}

- (void)presentMail:(id)a3
{
  id v4;
  _TtC12NewsArticles13MailPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1B9F1E660(v4);

}

- (_TtC12NewsArticles13MailPresenter)init
{
  _TtC12NewsArticles13MailPresenter *result;

  result = (_TtC12NewsArticles13MailPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0, a5);
}

@end
