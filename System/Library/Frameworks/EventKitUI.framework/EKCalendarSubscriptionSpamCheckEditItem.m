@implementation EKCalendarSubscriptionSpamCheckEditItem

- (void)setURLToCheck:(id)a3
{
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  EKCalendarSubscriptionSpamCheckEditItem *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = -[NSURL isEqual:](self->_currentURL, "isEqual:", v11);
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentURL, a3);
    -[NSURL absoluteString](self->_currentURL, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      if (!self->_inThrottlePeriod)
      {
        -[EKCalendarSubscriptionSpamCheckEditItem _setState:](self, "_setState:", 1);
        -[EKCalendarSubscriptionSpamCheckEditItem _sendSpamCheckRequest](self, "_sendSpamCheckRequest");
        goto LABEL_8;
      }
      v9 = self;
      v10 = 2;
    }
    else
    {
      v9 = self;
      v10 = 0;
    }
    -[EKCalendarSubscriptionSpamCheckEditItem _setState:](v9, "_setState:", v10);
LABEL_8:
    v6 = v11;
  }

}

- (void)_setState:(int)a3
{
  self->_state = a3;
  -[EKCalendarSubscriptionSpamCheckEditItem _updateUI](self, "_updateUI");
}

- (void)_sendSpamCheckRequest
{
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  NSURL *currentURL;
  _QWORD v7[5];
  _QWORD block[5];

  self->_inThrottlePeriod = 1;
  v3 = dispatch_time(0, 3000000000);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  v5 = (void *)MEMORY[0x1E0C80D38];
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  currentURL = self->_currentURL;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke_2;
  v7[3] = &unk_1E601B3A0;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0D0CE18], "checkURLForSpam:completionHandler:queue:", currentURL, v7, v5);

}

uint64_t __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_throttlePeriodEnded");
}

uint64_t __64__EKCalendarSubscriptionSpamCheckEditItem__sendSpamCheckRequest__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedSpamCheckResult:forURL:", a3, a2);
}

- (void)_throttlePeriodEnded
{
  self->_inThrottlePeriod = 0;
  if (self->_state == 2)
  {
    -[EKCalendarSubscriptionSpamCheckEditItem _setState:](self, "_setState:", 1);
    -[EKCalendarSubscriptionSpamCheckEditItem _sendSpamCheckRequest](self, "_sendSpamCheckRequest");
  }
}

- (void)_receivedSpamCheckResult:(BOOL)a3 forURL:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(a4, "isEqual:", self->_currentURL))
  {
    if (v4)
      v6 = 3;
    else
      v6 = 4;
    -[EKCalendarSubscriptionSpamCheckEditItem _setState:](self, "_setState:", v6);
    -[EKCalendarSubscriptionSpamCheckEditItem subscriptionSpamDelegate](self, "subscriptionSpamDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarSubscriptionSpamCheckEditItem:didDetermineThatURL:isSpam:", self, self->_currentURL, v4);

  }
}

- (void)_updateUI
{
  int state;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  if (!self->_cell)
    return;
  state = self->_state;
  if (state == 3)
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Warning: This calendar subscription is spam.");
  }
  else
  {
    if (state != 1)
    {
      v13 = CFSTR(" ");
      goto LABEL_9;
    }
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("Checking URL…");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v13);
  objc_msgSend(v7, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignment:", 1);

  if (self->_state == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell contentView](self->_cell, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  -[UITableViewCell setContentConfiguration:](self->_cell, "setContentConfiguration:", v7);
  -[UITableViewCell sizeToFit](self->_cell, "sizeToFit");
  -[UITableViewCell setNeedsLayout](self->_cell, "setNeedsLayout");

}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  UITableViewCell *v5;
  UITableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  cell = self->_cell;
  if (!cell)
  {
    v5 = (UITableViewCell *)objc_alloc_init(MEMORY[0x1E0DC3D50]);
    v6 = self->_cell;
    self->_cell = v5;

    objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR(" "));
    -[UITableViewCell setContentConfiguration:](self->_cell, "setContentConfiguration:", v7);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setBackgroundColor:](self->_cell, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell contentView](self->_cell, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[EKCalendarSubscriptionSpamCheckEditItem _updateUI](self, "_updateUI");
    cell = self->_cell;
  }
  return cell;
}

- (EKCalendarSubscriptionSpamCheckEditItemDelegate)subscriptionSpamDelegate
{
  return (EKCalendarSubscriptionSpamCheckEditItemDelegate *)objc_loadWeakRetained((id *)&self->_subscriptionSpamDelegate);
}

- (void)setSubscriptionSpamDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subscriptionSpamDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subscriptionSpamDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
}

@end
