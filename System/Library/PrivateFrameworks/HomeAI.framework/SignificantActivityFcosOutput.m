@implementation SignificantActivityFcosOutput

- (SignificantActivityFcosOutput)initWithHomeSSD_class_prob0:(id)a3 HomeSSD_box0_offset0:(id)a4 HomeSSD_box1_offset0:(id)a5 HomeSSD_object_roll0:(id)a6 HomeSSD_object_yaw0:(id)a7 HomeSSD_class_prob1:(id)a8 HomeSSD_box0_offset1:(id)a9 HomeSSD_box1_offset1:(id)a10 HomeSSD_object_roll1:(id)a11 HomeSSD_object_yaw1:(id)a12 HomeSSD_class_prob2:(id)a13 HomeSSD_box0_offset2:(id)a14 HomeSSD_box1_offset2:(id)a15 HomeSSD_object_roll2:(id)a16 HomeSSD_object_yaw2:(id)a17 HomeSSD_class_prob3:(id)a18 HomeSSD_box0_offset3:(id)a19 HomeSSD_box1_offset3:(id)a20 HomeSSD_object_roll3:(id)a21 HomeSSD_object_yaw3:(id)a22 HomeSSD_class_prob4:(id)a23 HomeSSD_box0_offset4:(id)a24 HomeSSD_box1_offset4:(id)a25 HomeSSD_object_roll4:(id)a26 HomeSSD_object_yaw4:(id)a27
{
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SignificantActivityFcosOutput *v39;
  SignificantActivityFcosOutput *v40;
  id v43;
  id v44;
  id v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  objc_super v65;

  v64 = a3;
  v43 = a4;
  v63 = a4;
  v44 = a5;
  v62 = a5;
  v61 = a6;
  v60 = a7;
  v45 = a8;
  v59 = a8;
  v58 = a9;
  v57 = a10;
  v56 = a11;
  v55 = a12;
  v54 = a13;
  v53 = a14;
  v52 = a15;
  v51 = a16;
  v50 = a17;
  v32 = a18;
  v33 = a19;
  v34 = a20;
  v35 = a21;
  v36 = a22;
  v37 = a23;
  v38 = a24;
  v49 = a25;
  v48 = a26;
  v47 = a27;
  v65.receiver = self;
  v65.super_class = (Class)SignificantActivityFcosOutput;
  v39 = -[SignificantActivityFcosOutput init](&v65, sel_init);
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_HomeSSD_class_prob0, a3);
    objc_storeStrong((id *)&v40->_HomeSSD_box0_offset0, v43);
    objc_storeStrong((id *)&v40->_HomeSSD_box1_offset0, v44);
    objc_storeStrong((id *)&v40->_HomeSSD_object_roll0, a6);
    objc_storeStrong((id *)&v40->_HomeSSD_object_yaw0, a7);
    objc_storeStrong((id *)&v40->_HomeSSD_class_prob1, v45);
    objc_storeStrong((id *)&v40->_HomeSSD_box0_offset1, a9);
    objc_storeStrong((id *)&v40->_HomeSSD_box1_offset1, a10);
    objc_storeStrong((id *)&v40->_HomeSSD_object_roll1, a11);
    objc_storeStrong((id *)&v40->_HomeSSD_object_yaw1, a12);
    objc_storeStrong((id *)&v40->_HomeSSD_class_prob2, a13);
    objc_storeStrong((id *)&v40->_HomeSSD_box0_offset2, a14);
    objc_storeStrong((id *)&v40->_HomeSSD_box1_offset2, a15);
    objc_storeStrong((id *)&v40->_HomeSSD_object_roll2, a16);
    objc_storeStrong((id *)&v40->_HomeSSD_object_yaw2, a17);
    objc_storeStrong((id *)&v40->_HomeSSD_class_prob3, a18);
    objc_storeStrong((id *)&v40->_HomeSSD_box0_offset3, a19);
    objc_storeStrong((id *)&v40->_HomeSSD_box1_offset3, a20);
    objc_storeStrong((id *)&v40->_HomeSSD_object_roll3, a21);
    objc_storeStrong((id *)&v40->_HomeSSD_object_yaw3, a22);
    objc_storeStrong((id *)&v40->_HomeSSD_class_prob4, a23);
    objc_storeStrong((id *)&v40->_HomeSSD_box0_offset4, a24);
    objc_storeStrong((id *)&v40->_HomeSSD_box1_offset4, a25);
    objc_storeStrong((id *)&v40->_HomeSSD_object_roll4, a26);
    objc_storeStrong((id *)&v40->_HomeSSD_object_yaw4, a27);
  }

  return v40;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC153C8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_class_prob0")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_class_prob0](self, "HomeSSD_class_prob0");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box0_offset0")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box0_offset0](self, "HomeSSD_box0_offset0");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box1_offset0")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box1_offset0](self, "HomeSSD_box1_offset0");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_roll0")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_roll0](self, "HomeSSD_object_roll0");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_yaw0")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_yaw0](self, "HomeSSD_object_yaw0");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_class_prob1")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_class_prob1](self, "HomeSSD_class_prob1");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box0_offset1")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box0_offset1](self, "HomeSSD_box0_offset1");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box1_offset1")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box1_offset1](self, "HomeSSD_box1_offset1");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_roll1")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_roll1](self, "HomeSSD_object_roll1");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_yaw1")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_yaw1](self, "HomeSSD_object_yaw1");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_class_prob2")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_class_prob2](self, "HomeSSD_class_prob2");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box0_offset2")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box0_offset2](self, "HomeSSD_box0_offset2");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box1_offset2")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box1_offset2](self, "HomeSSD_box1_offset2");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_roll2")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_roll2](self, "HomeSSD_object_roll2");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_yaw2")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_yaw2](self, "HomeSSD_object_yaw2");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_class_prob3")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_class_prob3](self, "HomeSSD_class_prob3");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box0_offset3")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box0_offset3](self, "HomeSSD_box0_offset3");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box1_offset3")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box1_offset3](self, "HomeSSD_box1_offset3");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_roll3")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_roll3](self, "HomeSSD_object_roll3");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_yaw3")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_yaw3](self, "HomeSSD_object_yaw3");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_class_prob4")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_class_prob4](self, "HomeSSD_class_prob4");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box0_offset4")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box0_offset4](self, "HomeSSD_box0_offset4");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_box1_offset4")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_box1_offset4](self, "HomeSSD_box1_offset4");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_roll4")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_roll4](self, "HomeSSD_object_roll4");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("HomeSSD_object_yaw4")))
    {
      v8 = 0;
      goto LABEL_52;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[SignificantActivityFcosOutput HomeSSD_object_yaw4](self, "HomeSSD_object_yaw4");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_52:
  return v8;
}

- (MLMultiArray)HomeSSD_class_prob0
{
  return self->_HomeSSD_class_prob0;
}

- (void)setHomeSSD_class_prob0:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_class_prob0, a3);
}

- (MLMultiArray)HomeSSD_box0_offset0
{
  return self->_HomeSSD_box0_offset0;
}

- (void)setHomeSSD_box0_offset0:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset0, a3);
}

- (MLMultiArray)HomeSSD_box1_offset0
{
  return self->_HomeSSD_box1_offset0;
}

- (void)setHomeSSD_box1_offset0:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset0, a3);
}

- (MLMultiArray)HomeSSD_object_roll0
{
  return self->_HomeSSD_object_roll0;
}

- (void)setHomeSSD_object_roll0:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_roll0, a3);
}

- (MLMultiArray)HomeSSD_object_yaw0
{
  return self->_HomeSSD_object_yaw0;
}

- (void)setHomeSSD_object_yaw0:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw0, a3);
}

- (MLMultiArray)HomeSSD_class_prob1
{
  return self->_HomeSSD_class_prob1;
}

- (void)setHomeSSD_class_prob1:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_class_prob1, a3);
}

- (MLMultiArray)HomeSSD_box0_offset1
{
  return self->_HomeSSD_box0_offset1;
}

- (void)setHomeSSD_box0_offset1:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset1, a3);
}

- (MLMultiArray)HomeSSD_box1_offset1
{
  return self->_HomeSSD_box1_offset1;
}

- (void)setHomeSSD_box1_offset1:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset1, a3);
}

- (MLMultiArray)HomeSSD_object_roll1
{
  return self->_HomeSSD_object_roll1;
}

- (void)setHomeSSD_object_roll1:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_roll1, a3);
}

- (MLMultiArray)HomeSSD_object_yaw1
{
  return self->_HomeSSD_object_yaw1;
}

- (void)setHomeSSD_object_yaw1:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw1, a3);
}

- (MLMultiArray)HomeSSD_class_prob2
{
  return self->_HomeSSD_class_prob2;
}

- (void)setHomeSSD_class_prob2:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_class_prob2, a3);
}

- (MLMultiArray)HomeSSD_box0_offset2
{
  return self->_HomeSSD_box0_offset2;
}

- (void)setHomeSSD_box0_offset2:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset2, a3);
}

- (MLMultiArray)HomeSSD_box1_offset2
{
  return self->_HomeSSD_box1_offset2;
}

- (void)setHomeSSD_box1_offset2:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset2, a3);
}

- (MLMultiArray)HomeSSD_object_roll2
{
  return self->_HomeSSD_object_roll2;
}

- (void)setHomeSSD_object_roll2:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_roll2, a3);
}

- (MLMultiArray)HomeSSD_object_yaw2
{
  return self->_HomeSSD_object_yaw2;
}

- (void)setHomeSSD_object_yaw2:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw2, a3);
}

- (MLMultiArray)HomeSSD_class_prob3
{
  return self->_HomeSSD_class_prob3;
}

- (void)setHomeSSD_class_prob3:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_class_prob3, a3);
}

- (MLMultiArray)HomeSSD_box0_offset3
{
  return self->_HomeSSD_box0_offset3;
}

- (void)setHomeSSD_box0_offset3:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset3, a3);
}

- (MLMultiArray)HomeSSD_box1_offset3
{
  return self->_HomeSSD_box1_offset3;
}

- (void)setHomeSSD_box1_offset3:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset3, a3);
}

- (MLMultiArray)HomeSSD_object_roll3
{
  return self->_HomeSSD_object_roll3;
}

- (void)setHomeSSD_object_roll3:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_roll3, a3);
}

- (MLMultiArray)HomeSSD_object_yaw3
{
  return self->_HomeSSD_object_yaw3;
}

- (void)setHomeSSD_object_yaw3:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw3, a3);
}

- (MLMultiArray)HomeSSD_class_prob4
{
  return self->_HomeSSD_class_prob4;
}

- (void)setHomeSSD_class_prob4:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_class_prob4, a3);
}

- (MLMultiArray)HomeSSD_box0_offset4
{
  return self->_HomeSSD_box0_offset4;
}

- (void)setHomeSSD_box0_offset4:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset4, a3);
}

- (MLMultiArray)HomeSSD_box1_offset4
{
  return self->_HomeSSD_box1_offset4;
}

- (void)setHomeSSD_box1_offset4:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset4, a3);
}

- (MLMultiArray)HomeSSD_object_roll4
{
  return self->_HomeSSD_object_roll4;
}

- (void)setHomeSSD_object_roll4:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_roll4, a3);
}

- (MLMultiArray)HomeSSD_object_yaw4
{
  return self->_HomeSSD_object_yaw4;
}

- (void)setHomeSSD_object_yaw4:(id)a3
{
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw4, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_roll4, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset4, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset4, 0);
  objc_storeStrong((id *)&self->_HomeSSD_class_prob4, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw3, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_roll3, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset3, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset3, 0);
  objc_storeStrong((id *)&self->_HomeSSD_class_prob3, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw2, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_roll2, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset2, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset2, 0);
  objc_storeStrong((id *)&self->_HomeSSD_class_prob2, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw1, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_roll1, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset1, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset1, 0);
  objc_storeStrong((id *)&self->_HomeSSD_class_prob1, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_yaw0, 0);
  objc_storeStrong((id *)&self->_HomeSSD_object_roll0, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box1_offset0, 0);
  objc_storeStrong((id *)&self->_HomeSSD_box0_offset0, 0);
  objc_storeStrong((id *)&self->_HomeSSD_class_prob0, 0);
}

@end
