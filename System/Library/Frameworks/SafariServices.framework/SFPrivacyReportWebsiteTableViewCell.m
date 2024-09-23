@implementation SFPrivacyReportWebsiteTableViewCell

- (SFPrivacyReportWebsiteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportWebsiteTableViewCell *v4;
  void *v5;
  SFPrivacyReportWebsiteTableViewCell *v6;

  v4 = -[SFPrivacyReportTrackingTableViewCell initWithDetailLabel:reuseIdentifier:](self, "initWithDetailLabel:reuseIdentifier:", 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportWebsiteTableViewCell setTintColor:](v4, "setTintColor:", v5);

    v6 = v4;
  }

  return v4;
}

- (void)setWebsite:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  WBSTrackedFirstParty *v8;

  v8 = (WBSTrackedFirstParty *)a3;
  if (self->_website != v8)
  {
    objc_storeStrong((id *)&self->_website, a3);
    -[WBSTrackedFirstParty domain](v8, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportTrackingTableViewCell domainLabel](self, "domainLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[WBSTrackedFirstParty trackers](v8, "trackers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportTrackingTableViewCell setCount:](self, "setCount:", (double)(unint64_t)objc_msgSend(v7, "count"));

  }
}

- (WBSTrackedFirstParty)website
{
  return self->_website;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_website, 0);
}

@end
