@implementation CPSInformationScrollView

- (void)setContentSize:(CGSize)a3
{
  void *v3;
  void *v4;
  uint64_t *block;
  NSObject *queue;
  objc_super v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[4];
  CPSInformationScrollView *v14;
  CGSize v15;

  v15 = a3;
  v14 = self;
  v13[3] = (id)a2;
  -[CPSInformationScrollView contentSize](self, "contentSize");
  v13[1] = v3;
  v13[2] = v4;
  if (!__CGSizeEqualToSize_0(v15.width, v15.height, *(double *)&v3, *(double *)&v4))
  {
    queue = MEMORY[0x24BDAC9B8];
    block = &v8;
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __43__CPSInformationScrollView_setContentSize___block_invoke;
    v12 = &unk_24E26F1B8;
    v13[0] = v14;
    dispatch_async(queue, &v8);

    objc_storeStrong(v13, 0);
  }
  v7.receiver = v14;
  v7.super_class = (Class)CPSInformationScrollView;
  -[CPSInformationScrollView setContentSize:](&v7, sel_setContentSize_, v15.width, v15.height, block);
}

void __43__CPSInformationScrollView_setContentSize___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "scrollviewDelegate");
  objc_msgSend(v2, "scrollViewContentSizeChanged:", *(_QWORD *)(a1 + 32));

}

- (CPSInformationScrollViewDelegate)scrollviewDelegate
{
  return (CPSInformationScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollviewDelegate);
}

- (void)setScrollviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollviewDelegate, a3);
}

- (NSMutableArray)focusWaypoints
{
  return self->_focusWaypoints;
}

- (void)setFocusWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_focusWaypoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusWaypoints, 0);
  objc_destroyWeak((id *)&self->_scrollviewDelegate);
}

@end
