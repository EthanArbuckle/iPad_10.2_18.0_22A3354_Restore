@implementation BPSTinkerFamilyDetails

- (FAFamilyMember)tinkerFamilyMember
{
  return self->_tinkerFamilyMember;
}

- (void)setTinkerFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_tinkerFamilyMember, a3);
}

- (FAFamilyMember)pairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (void)setPairingParentFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, a3);
}

- (FAFamilyMember)organizerParentFamilyMember
{
  return self->_organizerParentFamilyMember;
}

- (void)setOrganizerParentFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_organizerParentFamilyMember, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_tinkerFamilyMember, 0);
}

@end
