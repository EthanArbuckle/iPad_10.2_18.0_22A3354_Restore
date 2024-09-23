@implementation SCNNodeWeakComponent

- (SCNNodeWeakComponent)initWithType:(int64_t)a3 component:(id)a4
{
  id v6;
  SCNNodeWeakComponent *v7;
  SCNNodeWeakComponent *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCNNodeWeakComponent;
  v7 = -[SCNNodeWeakComponent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SCNNodeWeakComponent setType:](v7, "setType:", a3);
    -[SCNNodeWeakComponent setComponent:](v8, "setComponent:", v6);
  }

  return v8;
}

- (int64_t)type
{
  return self->type;
}

- (void)setType:(int64_t)a3
{
  self->type = a3;
}

- (id)component
{
  return objc_loadWeakRetained(&self->component);
}

- (void)setComponent:(id)a3
{
  objc_storeWeak(&self->component, a3);
}

- (SCNNodeComponent)next
{
  return self->next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->next, 0);
  objc_destroyWeak(&self->component);
}

@end
