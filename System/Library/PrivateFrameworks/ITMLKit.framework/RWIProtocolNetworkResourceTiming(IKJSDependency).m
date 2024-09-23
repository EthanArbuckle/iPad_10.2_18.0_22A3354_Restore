@implementation RWIProtocolNetworkResourceTiming(IKJSDependency)

+ (id)safe_initWithStartTime:()IKJSDependency redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:
{
  id v20;
  void *v21;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[13];

  v31[12] = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v30 = a1;
  v27 = a4;
  v28 = a3;
  v25 = a6;
  v26 = a5;
  v23 = a8;
  v24 = a7;
  v31[0] = &v30;
  v31[1] = &v29;
  v31[2] = &v28;
  v31[3] = &v27;
  v31[4] = &v26;
  v31[5] = &v25;
  v31[6] = &v24;
  v31[7] = &v23;
  v31[8] = &a17;
  v31[9] = &a18;
  v31[10] = &a19;
  v31[11] = &a20;
  v20 = objc_alloc(MEMORY[0x1E0DD9668]);
  objc_msgSend(v20, "ik_initWithSelectorString:arguments:", CFSTR("initWithStartTime:redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:"), v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
