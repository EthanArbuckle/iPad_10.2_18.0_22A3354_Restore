@implementation CBSensorActivityAttribution

- (CBSensorActivityAttribution)initWithDataAccessAttribution:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CBSensorActivityAttribution *v10;
  CBSensorActivityAttribution *v11;
  objc_super v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "dataAccessType");
  if (v5 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "locationAttribution"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityAttribution"));

    v7 = 2;
  }
  else if (v5 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraCaptureAttribution"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activityAttribution"));

    v7 = 0;
  }
  else if (v5)
  {
    v7 = 0;
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioRecordingActivityAttribution"));
    v7 = 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)CBSensorActivityAttribution;
  v10 = -[CBActivityAttribution initWithSTActivityAttribution:](&v13, "initWithSTActivityAttribution:", v6);
  v11 = v10;
  if (v10)
  {
    v10->_sensor = v7;
    v10->_usedRecently = objc_msgSend(v4, "isRecent");
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BSEqualsBuilder *v6;
  void *v7;
  int64_t v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v6 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:](BSEqualsBuilder, "builderWithObject:ofExpectedClass:", v4, objc_opt_class(CBSensorActivityAttribution, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[CBSensorActivityAttribution sensor](self, "sensor");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000FB74;
  v14[3] = &unk_100075708;
  v9 = v4;
  v15 = v9;
  v10 = objc_msgSend(v7, "appendInteger:counterpart:", v8, v14);
  if (objc_msgSend(v7, "isEqual"))
  {
    v13.receiver = self;
    v13.super_class = (Class)CBSensorActivityAttribution;
    v11 = -[CBActivityAttribution isEqual:](&v13, "isEqual:", v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](BSHashBuilder, "builder"));
  v8[1] = 3221225472;
  v8[2] = sub_10000FC24;
  v8[3] = &unk_100075730;
  v8[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v4 = objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  v5 = objc_msgSend(v3, "appendInteger:", -[CBSensorActivityAttribution sensor](self, "sensor"));
  v6 = objc_msgSend(v3, "hash");

  return (unint64_t)v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CBSensorActivityAttribution;
  v3 = -[CBActivityAttribution succinctDescriptionBuilder](&v9, "succinctDescriptionBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_10000F938(-[CBSensorActivityAttribution sensor](self, "sensor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("sensor"));

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBSensorActivityAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CBSensorActivityAttribution *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CBSensorActivityAttribution;
  v4 = a3;
  v5 = -[CBActivityAttribution descriptionBuilderWithMultilinePrefix:](&v12, "descriptionBuilderWithMultilinePrefix:", v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FE10;
  v9[3] = &unk_1000754E8;
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (int64_t)sensor
{
  return self->_sensor;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

@end
