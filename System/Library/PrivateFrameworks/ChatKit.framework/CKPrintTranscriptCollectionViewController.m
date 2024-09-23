@implementation CKPrintTranscriptCollectionViewController

- (CKPrintTranscriptCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKPrintTranscriptCollectionViewController;
  return -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:](&v7, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_, a3, a4, MEMORY[0x1E0C9AA60], a5, a6.top, a6.left, a6.bottom, a6.right);
}

- (void)updateUIContents
{
  id v2;

  -[CKTranscriptCollectionViewController collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

}

@end
