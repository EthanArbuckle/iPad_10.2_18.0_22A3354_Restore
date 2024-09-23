@implementation BMStream

- (id)source
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMStream;
  -[BMStreamBase source](&v3, sel_source);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)publisher
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMStream;
  -[BMStreamBase publisher](&v3, sel_publisher);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)publisherWithOptions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMStream;
  -[BMStreamBase publisherWithOptions:](&v4, sel_publisherWithOptions_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)publisherWithUseCase:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMStream;
  -[BMStreamBase publisherWithUseCase:options:](&v5, sel_publisherWithUseCase_options_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)publisherWithUseCase:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMStream;
  -[BMStreamBase publisherWithUseCase:](&v4, sel_publisherWithUseCase_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pruner
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMStream;
  -[BMStreamBase pruner](&v3, sel_pruner);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)prunerForDevice:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMStream;
  -[BMStreamBase prunerForDevice:](&v4, sel_prunerForDevice_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
