@implementation EKUILocationRowModel

- (EKUILocationRowModel)initWithConferenceRoom:(id)a3
{
  void *v4;
  EKUILocationRowModel *v5;

  objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKUILocationRowModel initWithType:location:conference:](self, "initWithType:location:conference:", 0, v4, 0);

  return v5;
}

- (EKUILocationRowModel)initWithSuggestedLocation:(id)a3
{
  void *v4;
  EKUILocationRowModel *v5;

  objc_msgSend(MEMORY[0x1E0CAA158], "locationWithTitle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKUILocationRowModel initWithType:location:conference:](self, "initWithType:location:conference:", 3, v4, 0);

  return v5;
}

- (EKUILocationRowModel)initWithStructuredLocation:(id)a3
{
  return -[EKUILocationRowModel initWithType:location:conference:](self, "initWithType:location:conference:", 1, a3, 0);
}

- (EKUILocationRowModel)initWithVirtualConference:(id)a3
{
  return -[EKUILocationRowModel initWithType:location:conference:](self, "initWithType:location:conference:", 2, 0, a3);
}

- (EKUILocationRowModel)initWithPendingConference:(id)a3
{
  return -[EKUILocationRowModel initWithType:location:conference:](self, "initWithType:location:conference:", 2, 0, 0);
}

- (EKUILocationRowModel)initWithType:(unint64_t)a3 location:(id)a4 conference:(id)a5
{
  id v9;
  id v10;
  EKUILocationRowModel *v11;
  EKUILocationRowModel *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKUILocationRowModel;
  v11 = -[EKUILocationRowModel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_locationType = a3;
    objc_storeStrong((id *)&v11->_location, a4);
    objc_storeStrong((id *)&v12->_conference, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_locationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EKUILocationRowModel: locationType: %@, location: %@, conference: %@, cell: %@"), v4, self->_location, self->_conference, self->_cell);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unint64_t)a3
{
  self->_locationType = a3;
}

- (EKStructuredLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (EKVirtualConference)conference
{
  return self->_conference;
}

- (void)setConference:(id)a3
{
  objc_storeStrong((id *)&self->_conference, a3);
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_conference, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
