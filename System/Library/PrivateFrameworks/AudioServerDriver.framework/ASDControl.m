@implementation ASDControl

- (ASDControl)initWithPlugin:(id)a3
{
  return -[ASDControl initWithElement:inScope:withPlugin:](self, "initWithElement:inScope:withPlugin:", 0, 1735159650, a3);
}

- (ASDControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return -[ASDControl initWithElement:inScope:withPlugin:andObjectClassID:](self, "initWithElement:inScope:withPlugin:andObjectClassID:", 0, 1735159650, a5, 1633907820);
}

- (ASDControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  ASDControl *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASDControl;
  result = -[ASDObject initWithPlugin:](&v10, sel_initWithPlugin_, a5);
  if (result)
  {
    result->_controlElement = a3;
    result->_controlScope = a4;
    result->_objectClassID = a6;
  }
  return result;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  objc_super v5;

  if (!a3)
    return 0;
  if (a3->mSelector == 1667591277 || a3->mSelector == 1668506480)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)ASDControl;
  return -[ASDObject hasProperty:](&v5, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  objc_super v7;

  if (!a3)
    return 0;
  if (a3->mSelector == 1667591277 || a3->mSelector == 1668506480)
    return 4;
  v7.receiver = self;
  v7.super_class = (Class)ASDControl;
  return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v7, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8;
  unsigned int v11;
  objc_super v13;

  v8 = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1667591277)
    {
      if (*a6 >= 4)
      {
        v11 = -[ASDControl controlElement](self, "controlElement");
        goto LABEL_10;
      }
    }
    else
    {
      if (a3->mSelector != 1668506480)
      {
        v13.receiver = self;
        v13.super_class = (Class)ASDControl;
        return -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v13, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
      }
      if (*a6 >= 4)
      {
        v11 = -[ASDControl controlScope](self, "controlScope");
LABEL_10:
        *(_DWORD *)a7 = v11;
        *a6 = 4;
        return 1;
      }
    }
    return 0;
  }
  return v8;
}

- (unsigned)baseClass
{
  return 1633907820;
}

- (unsigned)objectClass
{
  return self->_objectClassID;
}

- (BOOL)isKindOfAudioClass:(unsigned int)a3
{
  BOOL result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDControl;
  result = -[ASDObject isKindOfAudioClass:](&v5, sel_isKindOfAudioClass_);
  if (a3 == 1633907820)
    return 1;
  return result;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  objc_super v21;

  v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASDControl;
  v6 = a3;
  -[ASDObject diagnosticDescriptionWithIndent:walkTree:](&v21, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDControl controlScope](self, "controlScope");
  LODWORD(v9) = v8 >> 24;
  if ((v8 - 0x20000000) >> 24 >= 0x5F)
    v9 = 32;
  else
    v9 = v9;
  LODWORD(v10) = v8 << 8 >> 24;
  if (((v8 << 8) - 0x20000000) >> 24 >= 0x5F)
    v10 = 32;
  else
    v10 = v10;
  LODWORD(v11) = (__int16)v8 >> 8;
  if (((v8 << 16) - 0x20000000) >> 24 >= 0x5F)
    v11 = 32;
  else
    v11 = v11;
  if (v8 << 24 == 2130706432 || v8 << 24 < 520093697)
    v13 = 32;
  else
    v13 = (char)v8;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Control Scope: %c%c%c%c\n"), v6, v9, v10, v11, v13);
  v14 = -[ASDControl controlElement](self, "controlElement");
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  LODWORD(v17) = (__int16)v14 >> 8;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = v17;
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697)
    v19 = 32;
  else
    v19 = (char)v14;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Control Element: %c%c%c%c\n"), v6, v15, v16, v17, v19);

  return v7;
}

- (id)driverClassName
{
  return CFSTR("AudioControl");
}

- (unsigned)controlElement
{
  return self->_controlElement;
}

- (void)setControlElement:(unsigned int)a3
{
  self->_controlElement = a3;
}

- (unsigned)controlScope
{
  return self->_controlScope;
}

- (void)setControlScope:(unsigned int)a3
{
  self->_controlScope = a3;
}

@end
