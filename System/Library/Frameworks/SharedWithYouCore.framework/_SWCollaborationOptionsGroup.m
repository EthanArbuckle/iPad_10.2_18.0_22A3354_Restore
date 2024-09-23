@implementation _SWCollaborationOptionsGroup

- (NSArray)options
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWCollaborationOptionsGroup;
  -[SWCollaborationOptionsGroup options](&v3, sel_options);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOptions:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWCollaborationOptionsGroup;
  -[SWCollaborationOptionsGroup setOptions:](&v3, sel_setOptions_, a3);
}

- (_SWCollaborationOptionsGroup)initWithTitle:(id)a3 identifier:(id)a4 footer:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  _SWCollaborationOptionsGroup *v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = -[SWCollaborationOptionsGroup initWithIdentifier:options:](self, "initWithIdentifier:options:", a4, a6);
  if (v12)
  {
    v13 = (void *)objc_msgSend(v10, "copy");
    -[SWCollaborationOptionsGroup setTitle:](v12, "setTitle:", v13);

    v14 = (void *)objc_msgSend(v11, "copy");
    -[SWCollaborationOptionsGroup setFooter:](v12, "setFooter:", v14);

  }
  return v12;
}

@end
