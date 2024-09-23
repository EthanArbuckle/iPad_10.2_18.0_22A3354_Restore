@implementation MUConstraintLayout

- (MUConstraintLayout)initWithInternal:(id)a3
{
  id v5;
  MUConstraintLayout *v6;
  MUConstraintLayout *v7;
  MUConstraintLayout *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MUConstraintLayout;
    v6 = -[MUConstraintLayout init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_internal, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)activate
{
  -[MUConstraintLayoutInternal activate](self->_internal, "activate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (NSArray)layoutConstraints
{
  return -[MUConstraintLayoutInternal layoutConstraints](self->_internal, "layoutConstraints");
}

- (NSArray)layoutGuides
{
  return -[MUConstraintLayoutInternal layoutGuides](self->_internal, "layoutGuides");
}

- (int64_t)mode
{
  return -[MUConstraintLayoutInternal mode](self->_internal, "mode");
}

- (void)setMode:(int64_t)a3
{
  -[MUConstraintLayoutInternal setMode:](self->_internal, "setMode:", a3);
}

- (void)deactivate
{
  -[MUConstraintLayoutInternal deactivate](self->_internal, "deactivate");
}

- (void)prepare
{
  -[MUConstraintLayoutInternal prepare](self->_internal, "prepare");
}

- (UIView)viewForForwardingSetNeedsUpdateConstraints
{
  return -[MUConstraintLayoutInternal viewForForwardingSetNeedsUpdateConstraints](self->_internal, "viewForForwardingSetNeedsUpdateConstraints");
}

- (void)setViewForForwardingSetNeedsUpdateConstraints:(id)a3
{
  -[MUConstraintLayoutInternal setViewForForwardingSetNeedsUpdateConstraints:](self->_internal, "setViewForForwardingSetNeedsUpdateConstraints:", a3);
}

- (MUConstraintLayoutInternal)internal
{
  return self->_internal;
}

@end
