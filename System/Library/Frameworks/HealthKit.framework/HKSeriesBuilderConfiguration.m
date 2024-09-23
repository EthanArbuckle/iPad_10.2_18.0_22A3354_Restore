@implementation HKSeriesBuilderConfiguration

- (HKSeriesBuilderConfiguration)initWithDevice:(id)a3 workoutBuilderID:(id)a4
{
  id v6;
  id v7;
  HKSeriesBuilderConfiguration *v8;
  uint64_t v9;
  HKDevice *device;
  uint64_t v11;
  NSUUID *workoutBuilderID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSeriesBuilderConfiguration;
  v8 = -[HKSeriesBuilderConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    device = v8->_device;
    v8->_device = (HKDevice *)v9;

    v11 = objc_msgSend(v7, "copy");
    workoutBuilderID = v8->_workoutBuilderID;
    v8->_workoutBuilderID = (NSUUID *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKSeriesBuilderConfiguration initWithDevice:workoutBuilderID:](+[HKSeriesBuilderConfiguration allocWithZone:](HKSeriesBuilderConfiguration, "allocWithZone:", a3), "initWithDevice:workoutBuilderID:", self->_device, self->_workoutBuilderID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSeriesBuilderConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSeriesBuilderConfiguration *v5;
  uint64_t v6;
  HKDevice *device;
  uint64_t v8;
  NSUUID *workoutBuilderID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSeriesBuilderConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v6 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HKDevice *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutBuilderID"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutBuilderID = v5->_workoutBuilderID;
    v5->_workoutBuilderID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKSeriesBuilderConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_device, CFSTR("device"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutBuilderID, CFSTR("workoutBuilderID"));

}

- (HKDevice)device
{
  return self->_device;
}

- (NSUUID)workoutBuilderID
{
  return self->_workoutBuilderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutBuilderID, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
