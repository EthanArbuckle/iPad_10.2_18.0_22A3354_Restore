@implementation FBAInboxItemCell

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FBAInboxItemCell;
  -[FBAInboxItemCell awakeFromNib](&v10, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell fauxAccessoryView](self, "fauxAccessoryView"));
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell teamInfoLabel](self, "teamInfoLabel"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell unreadImageView](self, "unreadImageView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell orphanImageView](self, "orphanImageView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)updateWithItem:(id)a3 showingTeamName:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  id v54;

  v4 = a4;
  v54 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "displayTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "imageForNeedsAction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell unreadImageView](self, "unreadImageView"));
  objc_msgSend(v9, "setImage:", v8);

  v10 = objc_msgSend(v54, "needsAction") ^ 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell unreadImageView](self, "unreadImageView"));
  objc_msgSend(v11, "setHidden:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "needsActionTintColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell unreadImageView](self, "unreadImageView"));
  objc_msgSend(v13, "setTintColor:", v12);

  v14 = objc_msgSend(v54, "isOrphaned") ^ 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell orphanImageView](self, "orphanImageView"));
  objc_msgSend(v15, "setHidden:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "orphanBadgeTintColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell orphanImageView](self, "orphanImageView"));
  objc_msgSend(v17, "setTintColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell traitCollection](self, "traitCollection"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "preferredContentSizeCategory"));
  -[FBAInboxItemCell updateLabelLinesForContentSizeCategory:](self, "updateLabelLinesForContentSizeCategory:", v19);

  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "itemSubtitle"));
  v21 = -[__CFString length](v20, "length");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
  v23 = v22;
  if (v21)
    v24 = v20;
  else
    v24 = CFSTR(" ");
  objc_msgSend(v22, "setText:", v24);

  if (objc_msgSend(v54, "shouldShowAssigneeLabel"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "assignee"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fullName"));
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("UNASSIGNED"), &stru_1000EA660, FBKCommonStrings));

    }
    if (v4)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "singleTeam"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingFormat:", CFSTR(", %@"), v31));

      v28 = (id)v32;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell teamInfoLabel](self, "teamInfoLabel"));
    objc_msgSend(v33, "setText:", v28);

  }
  else
  {
    v28 = (id)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell teamInfoLabel](self, "teamInfoLabel"));
    objc_msgSend(v28, "setText:", 0);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "formattedMailboxSortDate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell dateLabel](self, "dateLabel"));
  objc_msgSend(v35, "setText:", v34);

  v36 = sub_100021DA8();
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mailboxSortDate"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringFromDate:", v38));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell dateLabel](self, "dateLabel"));
  objc_msgSend(v40, "setAccessibilityLabel:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "visibleFeedbackClosedStatus"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell closedLabel](self, "closedLabel"));
  objc_msgSend(v42, "setText:", v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "itemTitleColor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v44, "setTextColor:", v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "itemTitleColor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell teamInfoLabel](self, "teamInfoLabel"));
  objc_msgSend(v46, "setTextColor:", v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v48, "setTextColor:", v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell dateLabel](self, "dateLabel"));
  objc_msgSend(v50, "setTextColor:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell closedLabel](self, "closedLabel"));
  objc_msgSend(v52, "setTextColor:", v51);

  v53 = (unint64_t)-[FBAInboxItemCell accessibilityTraits](self, "accessibilityTraits");
  -[FBAInboxItemCell setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitButton | v53);

}

- (void)updateWithEnhancedLoggingSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell dateLabel](self, "dateLabel"));
  objc_msgSend(v9, "setText:", &stru_1000EA660);

  v10 = sub_100021DA8();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedAt"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromDate:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell dateLabel](self, "dateLabel"));
  objc_msgSend(v14, "setAccessibilityLabel:", v13);

  -[FBAInboxItemCell setTeamInfoLabel:](self, "setTeamInfoLabel:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell traitCollection](self, "traitCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
  -[FBAInboxItemCell updateLabelLinesForContentSizeCategory:](self, "updateLabelLinesForContentSizeCategory:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell closedLabel](self, "closedLabel"));
  objc_msgSend(v17, "setText:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "setTextColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v21, "setTextColor:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell dateLabel](self, "dateLabel"));
  objc_msgSend(v23, "setTextColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell closedLabel](self, "closedLabel"));
  objc_msgSend(v25, "setTextColor:", v24);

  v26 = (unint64_t)-[FBAInboxItemCell accessibilityTraits](self, "accessibilityTraits");
  -[FBAInboxItemCell setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitButton | v26);
}

- (void)updateLabelLinesForContentSizeCategory:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell titleLabel](self, "titleLabel"));
  v6 = v5;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v5, "setNumberOfLines:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v7, "setNumberOfLines:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell teamInfoLabel](self, "teamInfoLabel"));
    objc_msgSend(v8, "setNumberOfLines:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell unreadImageViewHeightConstraint](self, "unreadImageViewHeightConstraint"));
    v10 = 20.0;
  }
  else
  {
    objc_msgSend(v5, "setNumberOfLines:", 2);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v11, "setNumberOfLines:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell teamInfoLabel](self, "teamInfoLabel"));
    objc_msgSend(v12, "setNumberOfLines:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell unreadImageViewHeightConstraint](self, "unreadImageViewHeightConstraint"));
    v10 = 13.0;
  }
  v13 = v9;
  objc_msgSend(v9, "setConstant:", v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FBAInboxItemCell traitCollection](self, "traitCollection", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  -[FBAInboxItemCell updateLabelLinesForContentSizeCategory:](self, "updateLabelLinesForContentSizeCategory:", v4);

}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitleLabel);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_subtitleLabel, a3);
}

- (UILabel)teamInfoLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_teamInfoLabel);
}

- (void)setTeamInfoLabel:(id)a3
{
  objc_storeWeak((id *)&self->_teamInfoLabel, a3);
}

- (UILabel)dateLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_dateLabel);
}

- (void)setDateLabel:(id)a3
{
  objc_storeWeak((id *)&self->_dateLabel, a3);
}

- (UIImageView)unreadImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_unreadImageView);
}

- (void)setUnreadImageView:(id)a3
{
  objc_storeWeak((id *)&self->_unreadImageView, a3);
}

- (UIImageView)fauxAccessoryView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_fauxAccessoryView);
}

- (void)setFauxAccessoryView:(id)a3
{
  objc_storeWeak((id *)&self->_fauxAccessoryView, a3);
}

- (UILabel)closedLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_closedLabel);
}

- (void)setClosedLabel:(id)a3
{
  objc_storeWeak((id *)&self->_closedLabel, a3);
}

- (UIImageView)orphanImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_orphanImageView);
}

- (void)setOrphanImageView:(id)a3
{
  objc_storeWeak((id *)&self->_orphanImageView, a3);
}

- (NSLayoutConstraint)unreadImageViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_unreadImageViewHeightConstraint);
}

- (void)setUnreadImageViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_unreadImageViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unreadImageViewHeightConstraint);
  objc_destroyWeak((id *)&self->_orphanImageView);
  objc_destroyWeak((id *)&self->_closedLabel);
  objc_destroyWeak((id *)&self->_fauxAccessoryView);
  objc_destroyWeak((id *)&self->_unreadImageView);
  objc_destroyWeak((id *)&self->_dateLabel);
  objc_destroyWeak((id *)&self->_teamInfoLabel);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
}

@end
