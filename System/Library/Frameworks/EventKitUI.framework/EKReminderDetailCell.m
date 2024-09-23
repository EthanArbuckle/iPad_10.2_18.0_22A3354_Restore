@implementation EKReminderDetailCell

- (EKReminderDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 style:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  EKReminderDetailCell *v11;
  EKReminderDetailCell *v12;
  objc_super v14;

  v7 = a5;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKReminderDetailCell;
  v11 = -[EKEventDetailCell initWithEvent:editable:style:](&v14, sel_initWithEvent_editable_style_, a3, v7, a6);
  v12 = v11;
  if (v11)
    -[EKReminderDetailCell setReminder:](v11, "setReminder:", v10);

  return v12;
}

- (EKReminderDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5
{
  return -[EKReminderDetailCell initWithEvent:reminder:editable:style:](self, "initWithEvent:reminder:editable:style:", a3, a4, a5, 0);
}

- (void)setReminder:(id)a3
{
  REMReminder *v5;
  REMReminder *v6;

  v5 = (REMReminder *)a3;
  if (self->_reminder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_reminder, a3);
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminder, 0);
}

@end
