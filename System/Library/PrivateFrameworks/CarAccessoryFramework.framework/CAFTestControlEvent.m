@implementation CAFTestControlEvent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestControlEvent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestControlEvent;
  -[CAFService registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestControlEvent;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFTestDevEventNoParamsControl)testDevEventNoParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF00002C"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestDevEventNoParamsControl *)v4;
}

- (void)testDevEventNoParams
{
  void *v2;
  id v3;

  -[CAFTestControlEvent testDevEventNoParamsControl](self, "testDevEventNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "testDevEventNoParams");
    v2 = v3;
  }

}

- (BOOL)hasTestDevEventNoParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlEvent testDevEventNoParamsControl](self, "testDevEventNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevEventNoParamsError
{
  void *v2;
  char v3;

  -[CAFTestControlEvent testDevEventNoParamsControl](self, "testDevEventNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasErrorState");

  return v3;
}

- (BOOL)testDevEventNoParamsDisabled
{
  void *v2;
  char v3;

  -[CAFTestControlEvent testDevEventNoParamsControl](self, "testDevEventNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTestDevEventWithParamsControl)testDevEventWithParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF00002D"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestDevEventWithParamsControl *)v4;
}

- (void)testDevEventWithParamsWithTestInput9:(unsigned __int8)a3 testInput10:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[CAFTestControlEvent testDevEventWithParamsControl](self, "testDevEventWithParamsControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "testDevEventWithParamsWithTestInput9:testInput10:", v4, v8);

}

- (BOOL)hasTestDevEventWithParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlEvent testDevEventWithParamsControl](self, "testDevEventWithParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)testDevEventWithParamsError
{
  void *v2;
  char v3;

  -[CAFTestControlEvent testDevEventWithParamsControl](self, "testDevEventWithParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasErrorState");

  return v3;
}

- (BOOL)testDevEventWithParamsDisabled
{
  void *v2;
  char v3;

  -[CAFTestControlEvent testDevEventWithParamsControl](self, "testDevEventWithParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTestAccEventNoParamsControl)testAccEventNoParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF000032"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestAccEventNoParamsControl *)v4;
}

- (id)testAccEventNoParamsHandler
{
  void *v2;
  void *v3;

  -[CAFTestControlEvent testAccEventNoParamsControl](self, "testAccEventNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTestAccEventNoParamsHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTestControlEvent testAccEventNoParamsControl](self, "testAccEventNoParamsControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandler:", v4);

}

- (BOOL)hasTestAccEventNoParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlEvent testAccEventNoParamsControl](self, "testAccEventNoParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestAccEventWithParamsControl)testAccEventWithParamsControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x00000000FF000033"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTestAccEventWithParamsControl *)v4;
}

- (id)testAccEventWithParamsHandler
{
  void *v2;
  void *v3;

  -[CAFTestControlEvent testAccEventWithParamsControl](self, "testAccEventWithParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTestAccEventWithParamsHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTestControlEvent testAccEventWithParamsControl](self, "testAccEventWithParamsControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandler:", v4);

}

- (BOOL)hasTestAccEventWithParams
{
  void *v2;
  BOOL v3;

  -[CAFTestControlEvent testAccEventWithParamsControl](self, "testAccEventWithParamsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x00000000FE00000A");
}

+ (id)observerProtocol
{
  return &unk_25682E2E0;
}

- (void)_controlDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "controlType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("0x00000000FF00002C")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTestControlEvent testDevEventNoParamsControl](self, "testDevEventNoParamsControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "testControlEventServiceDidUpdateTestDevEventNoParams:", self);
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:", CFSTR("0x00000000FF00002D")))
    goto LABEL_8;
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFTestControlEvent testDevEventWithParamsControl](self, "testDevEventWithParamsControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
  {
    -[CAFService observers](self, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testControlEventServiceDidUpdateTestDevEventWithParams:", self);
    goto LABEL_8;
  }
LABEL_9:
  v15.receiver = self;
  v15.super_class = (Class)CAFTestControlEvent;
  -[CAFService _controlDidUpdate:](&v15, sel__controlDidUpdate_, v4);

}

- (BOOL)registeredForTestDevEventNoParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF00002C"));

  return v10;
}

- (BOOL)registeredForTestDevEventWithParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF00002D"));

  return v10;
}

- (BOOL)registeredForTestAccEventNoParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF000032"));

  return v10;
}

- (BOOL)registeredForTestAccEventWithParams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x00000000FF000033"));

  return v10;
}

@end
