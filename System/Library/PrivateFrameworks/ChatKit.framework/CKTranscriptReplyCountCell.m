@implementation CKTranscriptReplyCountCell

- (BOOL)wantsDrawerLayout
{
  return !-[CKTranscriptCell shouldFreezeReplyDecorationsForTimestampReveal](self, "shouldFreezeReplyDecorationsForTimestampReveal");
}

+ (void)transitionFromView:(id)a3 toView:(id)a4 duration:(double)a5 options:(unint64_t)a6 completion:(id)a7
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "transitionFromView:toView:duration:options:completion:", a3, a4, a6 | 0x500000, a7, a5);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptReplyCountCell;
  -[CKTranscriptStatusCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v9, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, a3, a4, a5, a7, a6);
  -[CKTranscriptStatusCell statusButton](self, "statusButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

}

@end
