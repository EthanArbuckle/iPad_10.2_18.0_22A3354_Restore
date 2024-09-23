@implementation HMMTRDuration

- (HMMTRDuration)initWithName:(id)a3 duration:(id)a4
{
  id v7;
  id v8;
  HMMTRDuration *v9;
  HMMTRDuration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRDuration;
  v9 = -[HMMTRDuration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_duration, a4);
  }

  return v10;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
