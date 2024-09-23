@implementation CTDataStatusBasic

- (void)setRoamAllowed:(BOOL)a3
{
  self->_roamAllowed = a3;
}

- (void)setNewRadioCoverage:(BOOL)a3
{
  self->_newRadioCoverage = a3;
}

- (void)setInHomeCountry:(BOOL)a3
{
  self->_inHomeCountry = a3;
}

- (void)setHasIndicator:(BOOL)a3
{
  self->_hasIndicator = a3;
}

- (void)setCellularDataPossible:(BOOL)a3
{
  self->_cellularDataPossible = a3;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)hasIndicator
{
  return self->_hasIndicator;
}

- (BOOL)cellularDataPossible
{
  return self->_cellularDataPossible;
}

- (BOOL)newRadioCoverage
{
  return self->_newRadioCoverage;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", attached=%d"), -[CTDataStatusBasic attached](self, "attached"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", hasIndicator=%d"), -[CTDataStatusBasic hasIndicator](self, "hasIndicator"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", inHomeCountry=%d"), -[CTDataStatusBasic inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", roamAllowed=%d"), -[CTDataStatusBasic roamAllowed](self, "roamAllowed"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellularDataPossible=%d"), -[CTDataStatusBasic cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", newRadioCoverage=%d"), -[CTDataStatusBasic newRadioCoverage](self, "newRadioCoverage"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAttached:", -[CTDataStatusBasic attached](self, "attached"));
  objc_msgSend(v4, "setHasIndicator:", -[CTDataStatusBasic hasIndicator](self, "hasIndicator"));
  objc_msgSend(v4, "setInHomeCountry:", -[CTDataStatusBasic inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v4, "setRoamAllowed:", -[CTDataStatusBasic roamAllowed](self, "roamAllowed"));
  objc_msgSend(v4, "setCellularDataPossible:", -[CTDataStatusBasic cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v4, "setNewRadioCoverage:", -[CTDataStatusBasic newRadioCoverage](self, "newRadioCoverage"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[CTDataStatusBasic attached](self, "attached");
  if (-[CTDataStatusBasic hasIndicator](self, "hasIndicator"))
    v4 |= 2u;
  if (-[CTDataStatusBasic inHomeCountry](self, "inHomeCountry"))
    v4 |= 4u;
  if (-[CTDataStatusBasic roamAllowed](self, "roamAllowed"))
    v4 |= 8u;
  if (-[CTDataStatusBasic cellularDataPossible](self, "cellularDataPossible"))
    v4 |= 0x10u;
  if (-[CTDataStatusBasic newRadioCoverage](self, "newRadioCoverage"))
    v5 = v4 | 0x20;
  else
    v5 = v4;
  objc_msgSend(v6, "encodeInt:forKey:", v5, CFSTR("DataStatusFlags"));

}

- (CTDataStatusBasic)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  unsigned int v6;
  int16x8_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTDataStatusBasic;
  v5 = -[CTDataStatusBasic init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DataStatusFlags"));
    v5[8] = v6 & 1;
    v7.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v6) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)(v5 + 9) = vmovn_s16(v7).u32[0];
    v5[13] = (v6 & 0x20) != 0;
  }

  return (CTDataStatusBasic *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)attached
{
  return self->_attached;
}

- (BOOL)inHomeCountry
{
  return self->_inHomeCountry;
}

- (BOOL)roamAllowed
{
  return self->_roamAllowed;
}

@end
