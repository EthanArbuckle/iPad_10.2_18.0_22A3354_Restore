@implementation SecConcrete_sec_array

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xpc_array, 0);
}

- (SecConcrete_sec_array)init
{
  SecConcrete_sec_array *v2;
  OS_xpc_object *v3;
  OS_xpc_object *xpc_array;
  SecConcrete_sec_array *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SecConcrete_sec_array;
  v2 = -[SecConcrete_sec_array init](&v7, sel_init);
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_array_create(0, 0);
    xpc_array = v2->xpc_array;
    v2->xpc_array = v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  OS_xpc_object *xpc_array;
  OS_xpc_object *v4;
  objc_super v5;
  _QWORD applier[5];

  xpc_array = self->xpc_array;
  if (xpc_array)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __32__SecConcrete_sec_array_dealloc__block_invoke;
    applier[3] = &unk_1E1FCDB70;
    applier[4] = self;
    xpc_array_apply(xpc_array, applier);
    v4 = self->xpc_array;
    self->xpc_array = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SecConcrete_sec_array;
  -[SecConcrete_sec_array dealloc](&v5, sel_dealloc);
}

@end
