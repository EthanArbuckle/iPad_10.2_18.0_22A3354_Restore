@implementation _SWCollaborationShareOptions

+ (_SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(id)a3 summary:(id)a4
{
  id v5;
  id v6;
  _SWCollaborationShareOptions *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SWCollaborationShareOptions initWithOptionsGroups:summary:]([_SWCollaborationShareOptions alloc], "initWithOptionsGroups:summary:", v6, v5);

  return v7;
}

+ (_SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(id)a3
{
  id v3;
  _SWCollaborationShareOptions *v4;

  v3 = a3;
  v4 = -[SWCollaborationShareOptions initWithOptionsGroups:]([_SWCollaborationShareOptions alloc], "initWithOptionsGroups:", v3);

  return v4;
}

- (NSArray)optionsGroups
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWCollaborationShareOptions;
  -[SWCollaborationShareOptions optionsGroups](&v3, sel_optionsGroups);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOptionsGroups:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWCollaborationShareOptions;
  -[SWCollaborationShareOptions setOptionsGroups:](&v3, sel_setOptionsGroups_, a3);
}

@end
