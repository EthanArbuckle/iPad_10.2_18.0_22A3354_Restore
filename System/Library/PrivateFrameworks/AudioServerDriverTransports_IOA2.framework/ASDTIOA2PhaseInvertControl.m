@implementation ASDTIOA2PhaseInvertControl

- (ASDTIOA2PhaseInvertControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 dictionary:(id)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2PhaseInvertControl;
  return -[ASDTIOA2BooleanControl initWithIOA2Device:userClientID:isSettable:element:scope:objectClassID:dictionary:](&v9, sel_initWithIOA2Device_userClientID_isSettable_element_scope_objectClassID_dictionary_, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 1885893481, a8);
}

@end
