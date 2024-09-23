@implementation HFCameraClipQueuePlayer

- (HFCameraClipQueuePlayer)initWithItems:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFCameraClipQueuePlayer;
  return -[HFCameraClipQueuePlayer initWithItems:](&v4, sel_initWithItems_, a3);
}

- (NSArray)items
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFCameraClipQueuePlayer;
  -[HFCameraClipQueuePlayer items](&v3, sel_items);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (HFCameraClipPlayerItem)currentItem
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_opt_class();
  v10.receiver = self;
  v10.super_class = (Class)HFCameraClipQueuePlayer;
  -[HFCameraClipQueuePlayer currentItem](&v10, sel_currentItem);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  return (HFCameraClipPlayerItem *)v6;
}

@end
