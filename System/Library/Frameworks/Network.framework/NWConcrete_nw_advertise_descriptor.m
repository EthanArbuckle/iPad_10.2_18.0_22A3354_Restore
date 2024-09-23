@implementation NWConcrete_nw_advertise_descriptor

- (void)dealloc
{
  OS_nw_txt_record *txt_record;
  char *name;
  char *type;
  char *domain;
  char *application_service_name;
  char *bundle_id;
  objc_super v9;

  txt_record = self->txt_record;
  self->txt_record = 0;

  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0;
  }
  type = self->type;
  if (type)
  {
    free(type);
    self->type = 0;
  }
  domain = self->domain;
  if (domain)
  {
    free(domain);
    self->domain = 0;
  }
  application_service_name = self->application_service_name;
  if (application_service_name)
  {
    free(application_service_name);
    self->application_service_name = 0;
  }
  bundle_id = self->bundle_id;
  if (bundle_id)
  {
    free(bundle_id);
    self->bundle_id = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_advertise_descriptor;
  -[NWConcrete_nw_advertise_descriptor dealloc](&v9, sel_dealloc);
}

- (NSString)description
{
  char *v2;

  v2 = (char *)nw_advertise_descriptor_copy_description(self);
  if (v2)
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->txt_record, 0);
}

@end
