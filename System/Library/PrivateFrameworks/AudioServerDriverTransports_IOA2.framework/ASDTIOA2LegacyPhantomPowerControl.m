@implementation ASDTIOA2LegacyPhantomPowerControl

- (ASDTIOA2LegacyPhantomPowerControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 dictionary:(id)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2LegacyPhantomPowerControl;
  return -[ASDTIOA2LegacyBooleanControl initWithIOA2Device:userClientID:isSettable:element:scope:objectClassID:dictionary:](&v9, sel_initWithIOA2Device_userClientID_isSettable_element_scope_objectClassID_dictionary_, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 1885888878, a8);
}

@end
