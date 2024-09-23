@implementation ATXEventTravelTimeDataSource

- (ATXEventTravelTimeDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXEventTravelTimeDataSource *v6;
  ATXEventTravelTimeDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXEventTravelTimeDataSource;
  v6 = -[ATXEventTravelTimeDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 callback:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[ATXEventTravelTimeDataSourceInternal sharedInstance](ATXEventTravelTimeDataSourceInternal, "sharedInstance");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:", v18, v17, v16, v15, v8, self->_device, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
