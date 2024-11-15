@implementation _BMRegistrarRegistration

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void)setDatabaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_databaseURL, a3);
}

- (NSString)sourceStreamID
{
  return self->_sourceStreamID;
}

- (void)setSourceStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceStreamID, a3);
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (void)setRegistrationDate:(id)a3
{
  objc_storeStrong((id *)&self->_registrationDate, a3);
}

- (NSDate)lastCommunicationDate
{
  return self->_lastCommunicationDate;
}

- (void)setLastCommunicationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCommunicationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCommunicationDate, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_sourceStreamID, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
