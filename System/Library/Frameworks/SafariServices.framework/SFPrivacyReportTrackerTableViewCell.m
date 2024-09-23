@implementation SFPrivacyReportTrackerTableViewCell

- (SFPrivacyReportTrackerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportTrackerTableViewCell *v4;
  void *v5;
  SFPrivacyReportTrackerTableViewCell *v6;

  v4 = -[SFPrivacyReportTrackingTableViewCell initWithDetailLabel:reuseIdentifier:](self, "initWithDetailLabel:reuseIdentifier:", 1, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportTrackerTableViewCell setTintColor:](v4, "setTintColor:", v5);

    v6 = v4;
  }

  return v4;
}

- (void)setTracker:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WBSKnownTrackingThirdParty *v10;

  v10 = (WBSKnownTrackingThirdParty *)a3;
  if (self->_tracker != v10)
  {
    objc_storeStrong((id *)&self->_tracker, a3);
    -[WBSKnownTrackingThirdParty domain](v10, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportTrackingTableViewCell domainLabel](self, "domainLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[WBSKnownTrackingThirdParty ownerName](v10, "ownerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportTrackingTableViewCell domainDetailLabel](self, "domainDetailLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[WBSKnownTrackingThirdParty firstParties](v10, "firstParties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportTrackingTableViewCell setCount:](self, "setCount:", (double)(unint64_t)objc_msgSend(v9, "count"));

  }
}

- (WBSKnownTrackingThirdParty)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
