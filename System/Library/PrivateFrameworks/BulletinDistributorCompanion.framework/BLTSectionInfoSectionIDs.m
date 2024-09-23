@implementation BLTSectionInfoSectionIDs

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_universalSectionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
