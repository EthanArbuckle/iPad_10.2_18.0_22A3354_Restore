@implementation ConversationSearchOverlayView

- (ConversationSearchOverlayView)initWithFrame:(CGRect)a3
{
  ConversationSearchOverlayView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ConversationSearchOverlayView;
  v3 = -[ConversationSearchOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ConversationSearchOverlayView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)show
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __37__ConversationSearchOverlayView_show__block_invoke;
  v7 = &unk_1E9A02B00;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_msgSend(v2, "initWithDuration:controlPoint1:controlPoint2:animations:", &v4, 0.2, 0.445, 0.05, 0.55, 0.95);
  objc_msgSend(v3, "startAnimation", v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __37__ConversationSearchOverlayView_show__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC3658], "mailConversationViewFindOverlayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setBackgroundColor:", v1);

}

- (void)hide
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __37__ConversationSearchOverlayView_hide__block_invoke;
  v7 = &unk_1E9A02B00;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_msgSend(v2, "initWithDuration:controlPoint1:controlPoint2:animations:", &v4, 0.2, 0.445, 0.05, 0.55, 0.95);
  objc_msgSend(v3, "startAnimation", v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __37__ConversationSearchOverlayView_hide__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setBackgroundColor:", v1);

}

@end
