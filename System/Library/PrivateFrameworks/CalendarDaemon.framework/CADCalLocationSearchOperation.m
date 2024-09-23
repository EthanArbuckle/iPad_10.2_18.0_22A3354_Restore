@implementation CADCalLocationSearchOperation

- (void)configureSearch:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSearchParticipants:", 0);
  objc_msgSend(v3, "setSearchLocations:", 1);
  objc_msgSend(v3, "setSearchAttendees:", 0);
  objc_msgSend(v3, "setShouldMatchLocationsOnlyForEventSearch:", 1);

}

@end
