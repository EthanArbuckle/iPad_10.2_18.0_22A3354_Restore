@implementation EKExpandedHashableReminder

- (EKExpandedHashableReminder)initWithEKEvent:(id)a3
{
  EKEvent *v4;
  EKExpandedHashableReminder *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSString *title;
  char v10;
  uint64_t v11;
  UIColor *color;
  uint64_t v13;
  NSString *buttonImageName;
  EKEvent *event;
  objc_super v17;

  v4 = (EKEvent *)a3;
  v17.receiver = self;
  v17.super_class = (Class)EKExpandedHashableReminder;
  v5 = -[EKExpandedHashableReminder init](&v17, sel_init);
  v5->_completed = -[EKEvent completed](v4, "completed");
  -[EKEvent startDate](v4, "startDate");
  v6 = objc_claimAutoreleasedReturnValue();
  date = v5->_date;
  v5->_date = (NSDate *)v6;

  -[EKEvent title](v4, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v8;

  v10 = -[EKEvent CUIK_reminderShouldBeEditable](v4, "CUIK_reminderShouldBeEditable");
  v5->_editable = v10;
  if ((v10 & 1) != 0)
    -[EKEvent CUIK_symbolColor](v4, "CUIK_symbolColor");
  else
    -[EKEvent CUIK_disabledSymbolColor](v4, "CUIK_disabledSymbolColor");
  v11 = objc_claimAutoreleasedReturnValue();
  color = v5->_color;
  v5->_color = (UIColor *)v11;

  -[EKEvent CUIK_symbolName](v4, "CUIK_symbolName");
  v13 = objc_claimAutoreleasedReturnValue();
  buttonImageName = v5->_buttonImageName;
  v5->_buttonImageName = (NSString *)v13;

  event = v5->_event;
  v5->_event = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  EKExpandedHashableReminder *v4;
  EKExpandedHashableReminder *v5;
  _BOOL4 completed;
  NSDate *date;
  void *v8;
  UIColor *color;
  void *v10;
  NSString *title;
  void *v12;
  NSString *buttonImageName;
  void *v14;
  _BOOL4 editable;
  char v16;

  v4 = (EKExpandedHashableReminder *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      completed = self->_completed;
      if (completed == -[EKExpandedHashableReminder completed](v5, "completed"))
      {
        date = self->_date;
        -[EKExpandedHashableReminder date](v5, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSDate isEqualToDate:](date, "isEqualToDate:", v8))
        {
          color = self->_color;
          -[EKExpandedHashableReminder color](v5, "color");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[UIColor isEqual:](color, "isEqual:", v10))
          {
            title = self->_title;
            -[EKExpandedHashableReminder title](v5, "title");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqualToString:](title, "isEqualToString:", v12))
            {
              buttonImageName = self->_buttonImageName;
              -[EKExpandedHashableReminder buttonImageName](v5, "buttonImageName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSString isEqualToString:](buttonImageName, "isEqualToString:", v14)
                && (editable = self->_editable, editable == -[EKExpandedHashableReminder editable](v5, "editable")))
              {
                v16 = -[EKEvent isEqual:](self->_event, "isEqual:", v5);
              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[UIColor hash](self->_color, "hash");
  v4 = -[NSDate hash](self->_date, "hash") + 13 * v3;
  v5 = -[NSString hash](self->_title, "hash") + 13 * v4;
  v6 = -[NSString hash](self->_buttonImageName, "hash");
  v7 = 1231;
  if (self->_completed)
    v8 = 1231;
  else
    v8 = 1237;
  if (!self->_editable)
    v7 = 1237;
  v9 = v8 + 13 * (v6 + 13 * v5);
  return -[EKEvent hash](self->_event, "hash") + 13 * (v7 + 13 * v9);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (NSString)buttonImageName
{
  return self->_buttonImageName;
}

- (void)setButtonImageName:(id)a3
{
  objc_storeStrong((id *)&self->_buttonImageName, a3);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_buttonImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
