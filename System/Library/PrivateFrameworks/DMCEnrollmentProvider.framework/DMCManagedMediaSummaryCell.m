@implementation DMCManagedMediaSummaryCell

- (void)setManagedBook:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "friendlyName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[DMCApplicationProxy bookIconForVariant:](DMCApplicationProxy, "bookIconForVariant:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCManagedMediaSummaryCell _setText:image:](self, "_setText:image:", v5, v4);

}

- (void)setManagedApp:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconForVariant:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCManagedMediaSummaryCell _setText:image:](self, "_setText:image:", v6, v5);
}

- (void)_setText:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DMCManagedMediaSummaryCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v8, "setImage:", v6);
  -[DMCManagedMediaSummaryCell setContentConfiguration:](self, "setContentConfiguration:", v8);

}

@end
