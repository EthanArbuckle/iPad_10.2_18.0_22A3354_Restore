@implementation CPSVoiceTemplateViewController

- (CPSVoiceTemplateViewController)initWithVoiceTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSVoiceTemplateViewController *v5;
  CPSVoiceView *v6;
  uint64_t v7;
  CPSVoiceView *titleView;
  CPSVoiceTemplateViewController *v10;
  CPSVoiceTemplateViewController *v13;
  objc_super v14;
  id v15;
  id v16;
  id location[2];
  CPSVoiceTemplateViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v5 = v18;
  v18 = 0;
  v14.receiver = v5;
  v14.super_class = (Class)CPSVoiceTemplateViewController;
  v13 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](&v14, sel_initWithTemplate_templateDelegate_templateEnvironment_, location[0], v16, v15);
  v18 = v13;
  objc_storeStrong((id *)&v18, v13);
  if (v13)
  {
    v6 = [CPSVoiceView alloc];
    v7 = -[CPSVoiceView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    titleView = v18->_titleView;
    v18->_titleView = (CPSVoiceView *)v7;

  }
  v10 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v10;
}

- (id)voiceTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast(v3, v4);

  return v5;
}

- (void)_viewDidLoad
{
  id v2;
  id v3;
  id v4;
  CPSVoiceView *v5;
  id v6;
  UIImageView *v7;
  CPSVoiceView *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CPSVoiceView *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CPSVoiceView *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CPSVoiceView *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  CPSVoiceView *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id location;
  objc_super v41;
  SEL v42;
  CPSVoiceTemplateViewController *v43;
  _QWORD v44[5];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v43 = self;
  v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)CPSVoiceTemplateViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v41, sel__viewDidLoad);
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v3 = (id)-[CPSVoiceTemplateViewController view](v43, "view");
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v6 = (id)-[CPSVoiceTemplateViewController view](v43, "view");
  v5 = -[CPSVoiceTemplateViewController titleView](v43, "titleView");
  objc_msgSend(v6, "addSubview:");

  v8 = -[CPSVoiceTemplateViewController titleView](v43, "titleView");
  v7 = -[CPSVoiceView imageView](v8, "imageView");
  -[UIImageView sizeToFit](v7, "sizeToFit");

  v9 = (void *)MEMORY[0x24BDD1628];
  v34 = -[CPSVoiceTemplateViewController titleView](v43, "titleView");
  v33 = (id)-[CPSVoiceView topAnchor](v34, "topAnchor");
  v32 = (id)-[CPSVoiceTemplateViewController view](v43, "view");
  v31 = (id)objc_msgSend(v32, "safeAreaLayoutGuide");
  v30 = (id)objc_msgSend(v31, "topAnchor");
  v29 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
  v44[0] = v29;
  v28 = -[CPSVoiceTemplateViewController titleView](v43, "titleView");
  v27 = (id)-[CPSVoiceView leadingAnchor](v28, "leadingAnchor");
  v26 = (id)-[CPSVoiceTemplateViewController view](v43, "view");
  v25 = (id)objc_msgSend(v26, "safeAreaLayoutGuide");
  v24 = (id)objc_msgSend(v25, "leadingAnchor");
  v23 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v44[1] = v23;
  v22 = -[CPSVoiceTemplateViewController titleView](v43, "titleView");
  v21 = (id)-[CPSVoiceView trailingAnchor](v22, "trailingAnchor");
  v20 = (id)-[CPSVoiceTemplateViewController view](v43, "view");
  v19 = (id)objc_msgSend(v20, "safeAreaLayoutGuide");
  v18 = (id)objc_msgSend(v19, "trailingAnchor");
  v17 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
  v44[2] = v17;
  v16 = -[CPSVoiceTemplateViewController titleView](v43, "titleView");
  v15 = (id)-[CPSVoiceView bottomAnchor](v16, "bottomAnchor");
  v14 = (id)-[CPSVoiceTemplateViewController view](v43, "view");
  v13 = (id)objc_msgSend(v14, "safeAreaLayoutGuide");
  v12 = (id)objc_msgSend(v13, "bottomAnchor");
  v11 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v44[3] = v11;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
  objc_msgSend(v9, "activateConstraints:");

  v2 = objc_alloc(MEMORY[0x24BDF6860]);
  v36 = (void *)objc_msgSend(v2, "initWithBarButtonSystemItem:target:action:", 1, v43, sel__dismissTemplateViewController);
  v35 = (id)-[CPSVoiceTemplateViewController navigationItem](v43, "navigationItem");
  objc_msgSend(v35, "setLeftBarButtonItem:", v36);

  v39 = -[CPSVoiceTemplateViewController voiceTemplate](v43, "voiceTemplate");
  v38 = (id)objc_msgSend(v39, "voiceControlStates");
  v37 = (id)objc_msgSend(v38, "firstObject");
  location = (id)objc_msgSend(v37, "identifier");

  if (location)
    -[CPSVoiceTemplateViewController _activateStateWithIdentifier:](v43, "_activateStateWithIdentifier:", location);
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  CPSVoiceTemplateViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPSVoiceTemplateViewController;
  -[CPSBaseTemplateViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  v3 = objc_alloc(MEMORY[0x24BDF6E80]);
  v6 = (id)objc_msgSend(v3, "initWithTarget:action:", v10, sel__backGestureFired_);
  objc_msgSend(v6, "setAllowedPressTypes:", &unk_24E29A7D0);
  v5 = (id)-[CPSVoiceTemplateViewController navigationController](v10, "navigationController");
  v4 = (id)objc_msgSend(v5, "view");
  objc_msgSend(v4, "addGestureRecognizer:", v6);

  -[CPSVoiceTemplateViewController setBackGestureRecognizer:](v10, "setBackGestureRecognizer:", v6);
  objc_storeStrong(&v6, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  UIImageView *v3;
  CPSVoiceView *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  CPSVoiceTemplateViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSVoiceTemplateViewController;
  -[CPSBaseTemplateViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4 = -[CPSVoiceTemplateViewController titleView](v8, "titleView");
  v3 = -[CPSVoiceView imageView](v4, "imageView");
  -[UIImageView startAnimating](v3, "startAnimating");

}

- (void)viewWillDisappear:(BOOL)a3
{
  UIImageView *v3;
  CPSVoiceView *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  CPSVoiceTemplateViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSVoiceTemplateViewController;
  -[CPSBaseTemplateViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  v4 = -[CPSVoiceTemplateViewController titleView](v8, "titleView");
  v3 = -[CPSVoiceView imageView](v4, "imageView");
  -[UIImageView stopAnimating](v3, "stopAnimating");

}

- (void)_backGestureFired:(id)a3
{
  id location[2];
  CPSVoiceTemplateViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "state") == 3)
    -[CPSBaseTemplateViewController _dismissTemplateViewController](v4, "_dismissTemplateViewController");
  objc_storeStrong(location, 0);
}

- (id)_stateWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(_QWORD *, void *);
  void *v13;
  id v14;
  uint64_t v15;
  id location[2];
  CPSVoiceTemplateViewController *v17;
  id v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  v7 = -[CPSVoiceTemplateViewController voiceTemplate](v17, "voiceTemplate");
  v6 = (id)objc_msgSend(v7, "voiceControlStates");
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __55__CPSVoiceTemplateViewController__stateWithIdentifier___block_invoke;
  v13 = &unk_24E26EF00;
  v14 = location[0];
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", &v9);

  v15 = v8;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = 0;
  }
  else
  {
    v5 = -[CPSVoiceTemplateViewController voiceTemplate](v17, "voiceTemplate");
    v4 = (id)objc_msgSend(v5, "voiceControlStates");
    v18 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", v15);

  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v18;
}

uint64_t __55__CPSVoiceTemplateViewController__stateWithIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  char v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "identifier");
  v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)_activateStateWithIdentifier:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSVoiceTemplateViewController *v9;
  id v10;
  id location[2];
  CPSVoiceTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __63__CPSVoiceTemplateViewController__activateStateWithIdentifier___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __63__CPSVoiceTemplateViewController__activateStateWithIdentifier___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_stateWithIdentifier:", *(_QWORD *)(a1 + 40));
  if (location[0])
  {
    objc_msgSend(*(id *)(a1 + 32), "lastVoiceTemplateStateChangeTime");
    if (v1 <= 0.0
      || (objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate"),
          v12 = v2,
          objc_msgSend(*(id *)(a1 + 32), "lastVoiceTemplateStateChangeTime"),
          v12 - v3 >= 0.5))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      objc_msgSend(*(id *)(a1 + 32), "setLastVoiceTemplateStateChangeTime:");
      v6 = (id)objc_msgSend(*(id *)(a1 + 32), "titleView");
      v5 = (id)objc_msgSend(v6, "titleLabel");
      v4 = (id)objc_msgSend(location[0], "titleVariants");
      objc_msgSend(v5, "setTextVariants:");

      v9 = (id)objc_msgSend(*(id *)(a1 + 32), "titleView");
      v8 = (id)objc_msgSend(v9, "imageView");
      v7 = (id)objc_msgSend(location[0], "image");
      objc_msgSend(v8, "setImage:");

      v11 = (id)objc_msgSend(*(id *)(a1 + 32), "titleView");
      v10 = (id)objc_msgSend(v11, "imageView");
      objc_msgSend(v10, "setAnimationRepeatCount:", (objc_msgSend(location[0], "repeats") & 1) == 0);

    }
  }
  objc_storeStrong(location, 0);
}

- (CPSVoiceView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UITapGestureRecognizer)backGestureRecognizer
{
  return self->_backGestureRecognizer;
}

- (void)setBackGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_backGestureRecognizer, a3);
}

- (double)lastVoiceTemplateStateChangeTime
{
  return self->_lastVoiceTemplateStateChangeTime;
}

- (void)setLastVoiceTemplateStateChangeTime:(double)a3
{
  self->_lastVoiceTemplateStateChangeTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
