@implementation IOThreadXPCWorkgroupTransporter

- (IOThreadXPCWorkgroupTransporter)initWithWorkgroup:(id)a3
{
  id v5;
  IOThreadXPCWorkgroupTransporter *v6;
  IOThreadXPCWorkgroupTransporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IOThreadXPCWorkgroupTransporter;
  v6 = -[IOThreadXPCWorkgroupTransporter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workgroup, a3);

  return v7;
}

- (IOThreadXPCWorkgroupTransporter)initWithCoder:(id)a3
{
  id v4;
  IOThreadXPCWorkgroupTransporter *v5;
  id v6;
  uint64_t v7;
  OS_xpc_object *workgroup;
  OS_xpc_object *v9;
  IOThreadXPCWorkgroupTransporter *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v12.receiver = self;
  v12.super_class = (Class)IOThreadXPCWorkgroupTransporter;
  v5 = -[IOThreadXPCWorkgroupTransporter init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "decodeXPCObjectForKey:", CFSTR("IOThreadXPCWorkgroupTransporter"));
    v7 = objc_claimAutoreleasedReturnValue();
    workgroup = v5->_workgroup;
    v5->_workgroup = (OS_xpc_object *)v7;

    if (!v5->_workgroup)
    {

      v10 = 0;
      goto LABEL_10;
    }
    if (MEMORY[0x24267E8A4]() == MEMORY[0x24BDACFE0])
    {
      v9 = v5->_workgroup;
      v5->_workgroup = 0;

    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (void)dealloc
{
  OS_xpc_object *workgroup;
  objc_super v4;

  workgroup = self->_workgroup;
  self->_workgroup = 0;

  v4.receiver = self;
  v4.super_class = (Class)IOThreadXPCWorkgroupTransporter;
  -[IOThreadXPCWorkgroupTransporter dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v7 = v4;
  -[IOThreadXPCWorkgroupTransporter workgroup](self, "workgroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IOThreadXPCWorkgroupTransporter workgroup](self, "workgroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = xpc_null_create();
  }
  objc_msgSend(v7, "encodeXPCObject:forKey:", v6, CFSTR("IOThreadXPCWorkgroupTransporter"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IOThreadXPCWorkgroupTransporter workgroup](self, "workgroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IOThreadXPCWorkgroupTransporter workgroup](self, "workgroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "workgroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = xpc_equal(v7, v8);

    }
    else
    {
      objc_msgSend(v5, "workgroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 == 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (IOThreadWorkgroup)getWorkgroup
{
  IOThreadWorkgroup *v2;
  IOThreadWorkgroup *v3;
  mach_port_t v4;
  IOThreadWorkgroup v5;
  id v6;
  OS_os_workgroup *v7;

  v3 = v2;
  -[IOThreadXPCWorkgroupTransporter workgroup](self, "workgroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = xpc_mach_send_copy_right();

  v7 = os_workgroup_create_with_port("IsolatedCoreAudioClientWorkgroup", v4);
  IOThreadWorkgroup::IOThreadWorkgroup(v3, v7);

  return v5;
}

- (OS_xpc_object)workgroup
{
  return self->_workgroup;
}

- (void)setWorkgroup:(id)a3
{
  objc_storeStrong((id *)&self->_workgroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workgroup, 0);
}

+ (id)transporter:(const void *)a3
{
  OS_os_workgroup *v3;
  uint64_t v4;
  void *v5;
  IOThreadXPCWorkgroupTransporter *v6;
  mach_port_t mach_port_out;

  mach_port_out = 0;
  v3 = *(OS_os_workgroup **)(*(_QWORD *)a3 + 8);
  caulk::mach::os_object<OS_os_workgroup * {__strong}>::get(v3);
  objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = os_workgroup_copy_port(v3, &mach_port_out);
    if ((_DWORD)v4)
    {
      NSLog(CFSTR("Failed to get the mach port from provided workgroup: %d"), v4);
      mach_port_out = 0;
    }
  }
  v5 = (void *)xpc_mach_send_create();
  v6 = -[IOThreadXPCWorkgroupTransporter initWithWorkgroup:]([IOThreadXPCWorkgroupTransporter alloc], "initWithWorkgroup:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
