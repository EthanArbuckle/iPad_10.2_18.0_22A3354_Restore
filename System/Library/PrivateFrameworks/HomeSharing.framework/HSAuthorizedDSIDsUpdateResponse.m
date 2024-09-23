@implementation HSAuthorizedDSIDsUpdateResponse

- (NSArray)authorizedDSIDs
{
  return self->authorizedDSIDs;
}

- (void)setAuthorizedDSIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->authorizedDSIDs, 0);
}

@end
