@implementation IAMCountableEvent

- (IAMCountableEvent)initWithName:(id)a3
{
  id v4;
  IAMCountableEvent *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IAMCountableEvent;
  v5 = -[IAMCountableEvent init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    -[IAMEvent setName:](v5, "setName:", v6);

    -[IAMEvent setType:](v5, "setType:", 0);
  }

  return v5;
}

@end
