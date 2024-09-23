@implementation CUNetLinkEndpoint

- (id)description
{
  return -[CUNetLinkEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t state;
  const char *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFMutableStringRef *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __CFString *v62;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  CFMutableStringRef v67;
  CFMutableStringRef v68;
  CFMutableStringRef v69;
  timeval v70;
  CFMutableStringRef v71;
  CFMutableStringRef v72;
  CFMutableStringRef v73;
  CFMutableStringRef v74;
  CFMutableStringRef v75;

  v75 = 0;
  NSAppendPrintF(&v75, (uint64_t)"CUNetLinkEndpoint %##a", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)&self->_ipAddr);
  v16 = v75;
  v74 = v16;
  state = self->_state;
  if (state > 3)
    v18 = "?";
  else
    v18 = off_1E25DE110[state];
  NSAppendPrintF(&v74, (uint64_t)", St %s", v10, v11, v12, v13, v14, v15, (uint64_t)v18);
  v19 = v74;

  v73 = v19;
  NSAppendPrintF(&v73, (uint64_t)", StCh %u", v20, v21, v22, v23, v24, v25, self->_stateChanges);
  v26 = v73;

  if (self->_expiredTicks)
  {
    v72 = v26;
    v33 = mach_absolute_time();
    v65 = UpTicksToSeconds(v33 - self->_expiredTicks);
    v34 = &v72;
    NSAppendPrintF(&v72, (uint64_t)", Expired %llu secs ago", v35, v36, v37, v38, v39, v40, v65);
  }
  else
  {
    v71 = v26;
    v34 = &v71;
    NSAppendPrintF(&v71, (uint64_t)", Expired No", v27, v28, v29, v30, v31, v32, v64);
  }
  v41 = *v34;

  v70.tv_sec = 0;
  *(_QWORD *)&v70.tv_usec = 0;
  gettimeofday(&v70, 0);
  v69 = v41;
  NSAppendPrintF(&v69, (uint64_t)", Expire %lld", v42, v43, v44, v45, v46, v47, self->_expireTime - v70.tv_sec);
  v48 = v69;

  v68 = v48;
  NSAppendPrintF(&v68, (uint64_t)", Probes %u", v49, v50, v51, v52, v53, v54, self->_seqNum);
  v55 = v68;

  if (a3 <= 20)
  {
    v67 = v55;
    NSAppendPrintF(&v67, (uint64_t)"\n", v56, v57, v58, v59, v60, v61, v66);
    v62 = v67;

    v55 = v62;
  }
  return v55;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)ipAddr
{
  retstr->var0 = (sockaddr)self->var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self->var2.sin6_addr + 12);
  return self;
}

- (void)setIpAddr:(id *)a3
{
  sockaddr var0;

  var0 = a3->var0;
  *(in6_addr *)((char *)&self->_ipAddr.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_ipAddr.sa = var0;
}

- (BOOL)isClient
{
  return self->_client;
}

- (int)state
{
  return self->_state;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
}

@end
