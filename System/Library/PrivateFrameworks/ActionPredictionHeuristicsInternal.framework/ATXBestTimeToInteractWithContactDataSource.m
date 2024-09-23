@implementation ATXBestTimeToInteractWithContactDataSource

- (ATXBestTimeToInteractWithContactDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXBestTimeToInteractWithContactDataSource *v6;
  ATXBestTimeToInteractWithContactDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXBestTimeToInteractWithContactDataSource;
  v6 = -[ATXBestTimeToInteractWithContactDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)hourOfDayInteractionProbabilitiesWithContact:(id)a3 callback:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5488) & 1) != 0)
  {
    v7 = (void *)objc_opt_new();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hourOfDayProbabilitiesToInteractWithContacts:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11, 0);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA70], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
