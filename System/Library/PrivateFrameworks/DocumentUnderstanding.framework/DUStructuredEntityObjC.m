@implementation DUStructuredEntityObjC

- (DUStructuredEntityObjC)init
{
  DUStructuredEntityObjC *v2;
  _TtC21DocumentUnderstanding18DUStructuredEntity *v3;
  _TtC21DocumentUnderstanding18DUStructuredEntity *underlying;
  DUStructuredEntityObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUStructuredEntityObjC;
  v2 = -[DUStructuredEntityObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding18DUStructuredEntity);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)title
{
  return -[DUStructuredEntity title](self->_underlying, "title");
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setTitle:](self->_underlying, "setTitle:", v4);

}

- (NSString)type
{
  return -[DUStructuredEntity type](self->_underlying, "type");
}

- (void)setType:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setType:](self->_underlying, "setType:", v4);

}

- (NSString)phoneNumber
{
  return -[DUStructuredEntity phoneNumber](self->_underlying, "phoneNumber");
}

- (void)setPhoneNumber:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setPhoneNumber:](self->_underlying, "setPhoneNumber:", v4);

}

- (NSString)email
{
  return -[DUStructuredEntity email](self->_underlying, "email");
}

- (void)setEmail:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setEmail:](self->_underlying, "setEmail:", v4);

}

- (NSString)url
{
  return -[DUStructuredEntity url](self->_underlying, "url");
}

- (void)setUrl:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setUrl:](self->_underlying, "setUrl:", v4);

}

- (NSDictionary)addressComponents
{
  return -[DUStructuredEntity addressComponents](self->_underlying, "addressComponents");
}

- (void)setAddressComponents:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setAddressComponents:](self->_underlying, "setAddressComponents:", v4);

}

- (DUCalendarEventObjC)calendarEvent
{
  void *v2;
  void *v3;

  -[DUStructuredEntity calendarEvent](self->_underlying, "calendarEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objCCalendarEventForCalendarEvent:](DUObjCCompatibilityUtils, "objCCalendarEventForCalendarEvent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUCalendarEventObjC *)v3;
}

- (void)setCalendarEvent:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils calendarEventForObjCCalendarEvent:](DUObjCCompatibilityUtils, "calendarEventForObjCCalendarEvent:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUStructuredEntity setCalendarEvent:](self->_underlying, "setCalendarEvent:", v4);

}

- (NSString)homeAutomationID
{
  return -[DUStructuredEntity homeAutomationID](self->_underlying, "homeAutomationID");
}

- (void)setHomeAutomationID:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUStructuredEntity setHomeAutomationID:](self->_underlying, "setHomeAutomationID:", v4);

}

- (DUDisplayInfoObjC)displayInfo
{
  void *v2;
  void *v3;

  -[DUStructuredEntity displayInfo](self->_underlying, "displayInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objCForDisplayInfo:](DUObjCCompatibilityUtils, "objCForDisplayInfo:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUDisplayInfoObjC *)v3;
}

- (void)setDisplayInfo:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils displayInfoForObjC:](DUObjCCompatibilityUtils, "displayInfoForObjC:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUStructuredEntity setDisplayInfo:](self->_underlying, "setDisplayInfo:", v4);

}

- (DUDebugInfoObjC)responseDebugInfo
{
  void *v2;
  void *v3;

  -[DUStructuredEntity responseDebugInfo](self->_underlying, "responseDebugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUDebugInfoObjC *)v3;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUStructuredEntity setResponseDebugInfo:](self->_underlying, "setResponseDebugInfo:", v4);

}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
