@implementation QLDismissAction

- (QLDismissAction)initWithTitle:(id)a3 image:(id)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  QLDismissAction *v14;
  QLDismissAction *v15;
  void *v16;
  id completionHandler;
  QLDismissAction *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)QLDismissAction;
  v14 = -[QLDismissAction init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_title, a3);
    objc_storeStrong((id *)&v15->_image, a4);
    v16 = _Block_copy(v13);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = v16;

    v15->_shouldDismissQuickLookAutomatically = a5;
    v18 = v15;
  }

  return v15;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return +[QLDismissAction actionWithTitle:image:shouldDismissQuickLookAutomatically:handler:](QLDismissAction, "actionWithTitle:image:shouldDismissQuickLookAutomatically:handler:", a3, a4, 1, a5);
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  QLDismissAction *v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[QLDismissAction initWithTitle:image:shouldDismissQuickLookAutomatically:handler:]([QLDismissAction alloc], "initWithTitle:image:shouldDismissQuickLookAutomatically:handler:", v11, v10, v6, v9);

  return v12;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 alertStyle:(int64_t)a5 shouldDismissQuickLookAutomatically:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  QLDismissAction *v14;

  v7 = a6;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = -[QLDismissAction initWithTitle:image:shouldDismissQuickLookAutomatically:handler:]([QLDismissAction alloc], "initWithTitle:image:shouldDismissQuickLookAutomatically:handler:", v13, v12, v7, v11);

  if (a5 == 2)
    -[QLDismissAction setAttributes:](v14, "setAttributes:", 2);
  return v14;
}

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  return +[QLDismissAction actionWithTitle:alertStyle:shouldDismissQuickLookAutomatically:handler:](QLDismissAction, "actionWithTitle:alertStyle:shouldDismissQuickLookAutomatically:handler:", a3, 0, 1, a4);
}

+ (id)actionWithTitle:(id)a3 alertStyle:(int64_t)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  QLDismissAction *v11;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = -[QLDismissAction initWithTitle:image:shouldDismissQuickLookAutomatically:handler:]([QLDismissAction alloc], "initWithTitle:image:shouldDismissQuickLookAutomatically:handler:", v10, 0, v6, v9);

  if (a4 == 2)
    -[QLDismissAction setAttributes:](v11, "setAttributes:", 2);
  return v11;
}

- (int64_t)alertStyle
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setAlertStyle:(int64_t)a3
{
  self->_alertStyle = a3;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

- (BOOL)shouldDismissQuickLookAutomatically
{
  return self->_shouldDismissQuickLookAutomatically;
}

- (void)setShouldDismissQuickLookAutomatically:(BOOL)a3
{
  self->_shouldDismissQuickLookAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
