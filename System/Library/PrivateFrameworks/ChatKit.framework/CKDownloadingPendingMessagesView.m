@implementation CKDownloadingPendingMessagesView

- (CKDownloadingPendingMessagesView)init
{
  return (CKDownloadingPendingMessagesView *)CKDownloadingPendingMessagesView.init()();
}

- (CKDownloadingPendingMessagesView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E568C7C();
}

- (void)updateMessageCountWith:(id)a3
{
  void *v4;
  id v5;
  CKDownloadingPendingMessagesView *v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKDownloadingPendingMessagesView_pendingMessageCountLabel);
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, sel_setAttributedText_, v5);
  sub_18E5672A8();

}

- (void)updateForLayoutDirectionWithScale:(double)a3
{
  CKDownloadingPendingMessagesView *v4;

  v4 = self;
  sub_18E5674B8(a3);

}

- (void)layoutSubviews
{
  CKDownloadingPendingMessagesView *v2;

  v2 = self;
  sub_18E5675F8();

}

- (CKDownloadingPendingMessagesView)initWithFrame:(CGRect)a3
{
  CKDownloadingPendingMessagesView *result;

  result = (CKDownloadingPendingMessagesView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKDownloadingPendingMessagesView_pendingMessageCountLabel));

}

- (void)startAppearanceAnimations
{
  CKDownloadingPendingMessagesView *v2;

  v2 = self;
  sub_18E568420();

}

@end
